from django.shortcuts import render
from .models import Empresa

def datos_empresa(request):
    empresa = Empresa.objects.all()
    return render(request, 'Datos_Empresa.html', {'empresa': empresa})
