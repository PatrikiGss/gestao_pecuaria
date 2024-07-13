from rest_framework import viewsets
from django.db import models
from .models import Usuario,Produtor,Propriedade,Laboratorio,Cultura,AnaliseSolo,Recomendacao 
from .serializers import UsuarioSerializer,ProdutorSerializer,PropriedadeSerializer,LaboratorioSerializer,CulturaSerializer,AnaliseSoloSerializer,RecomendacaoSerializer


class UsuarioViewSet(viewsets.ModelViewSet):
    queryset = Usuario.objects.all()
    serializer_class=UsuarioSerializer
    
 
class ProdutorViewSet(viewsets.ModelViewSet):
    queryset = Produtor.objects.all()
    serializer_class = ProdutorSerializer


class PropriedadeViewSet(viewsets.ModelViewSet):
    queryset = Propriedade.objects.all()
    serializer_class = PropriedadeSerializer


class LaboratorioViewSet(viewsets.ModelViewSet):
    queryset=Laboratorio.objects.all()
    serializer_class=LaboratorioSerializer


class CulturaViewSet(viewsets.ModelViewSet):
    queryset=Cultura.objects.all()
    serializer_class=CulturaSerializer


class AnaliseSoloViewSet(viewsets.ModelViewSet):
    queryset=AnaliseSolo.objects.all()
    serializer_class=AnaliseSoloSerializer


class RecomendacaoViewSet(viewsets.ModelViewSet):
    queryset=Recomendacao.objects.all()
    serializer_class= RecomendacaoSerializer