from django.shortcuts import render
from .models import Mecanicos

def lista_mecanicos(request):
    mecanico = Mecanicos.objects.all()
    return render(request, 'lista_mecanico.html', {'mecanicos': mecanico})
