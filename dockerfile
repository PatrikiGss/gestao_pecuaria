FROM python:3.11.3-alpine3.18

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Definição do diretório de trabalho
WORKDIR /Projeto_Pesquisa_e_Gestão_Pecuaria

# Cópia do código do projeto e scripts
COPY ./Projeto_Pesquisa_e_Gestão_Pecuaria /Projeto_Pesquisa_e_Gestão_Pecuaria
COPY ./scripts /scripts

# Expor a porta 8000
EXPOSE 8000

# Instalação das dependências
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /Projeto_Pesquisa_e_Gestão_Pecuaria/requirements.txt

# Ajuste do PATH
ENV PATH="/scripts:/venv/bin:$PATH"

# Adiciona usuário não privilegiado com UID e GID específicos
RUN addgroup -g 1000 duser && \
    adduser -D -u 1000 -G duser duser

# Cria diretórios e ajustar permissões
RUN mkdir -p /data/web/static/admin /data/web/media && \
    chown -R duser:duser /data/web && \
    chmod -R 755 /data/web

RUN chmod -R +x /scripts

# Verifica permissões e usuário atual (comando de depuração)
RUN ls -la /data/web/static /data/web/media /data/web/static/admin
RUN whoami
RUN pwd

# Usa o usuário não privilegiado
USER duser

# Comando de inicialização do contêiner
CMD ["sh", "-c", "/scripts/commands.sh"]
