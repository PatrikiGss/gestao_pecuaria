#!/bin/sh
set -e

# Verifica se as variáveis de ambiente estão definidas
if [ -z "$POSTGRES_HOST" ] || [ -z "$POSTGRES_PORT" ]; then
    echo "ERROR: POSTGRES_HOST e POSTGRES_PORT precisam ser definidos."
    exit 1
fi

# Aguarde até que o PostgreSQL esteja disponível
while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
    echo "🟡 Waiting for Postgres Database Startup ($POSTGRES_HOST:$POSTGRES_PORT) ..."
    sleep 2
done

echo "✅ Postgres Database Started Successfully ($POSTGRES_HOST:$POSTGRES_PORT)"

# Coletar arquivos estáticos
python manage.py collectstatic --noinput

# Faz a migração toda vez que o serviço entrar em excecução
python manage.py makemigrations --noinput

# Aplicar migrações do banco de dados
python manage.py migrate --noinput

# Iniciar o servidor de desenvolvimento
python manage.py runserver 0.0.0.0:8000
