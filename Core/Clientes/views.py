from django.shortcuts import render
from .models import Clientes
from Mecanicos.models import Mecanicos
from Vehiculo.models import Vehiculo
from Empresa.models import Empresa
from Productos.models import Productos
from Servicios.models import Servicios

def index(request):
    return render(request, 'index.html')


def lista_clientes(request):
    clientes = Clientes.objects.all()
    # print(clientes)
    return render(request, 'lista_clientes.html', {'clientes': clientes})

def lista_mecanicos(request):
    mecanico = Mecanicos.objects.all()
    return render(request, 'lista_mecanico.html', {'mecanicos': mecanico})

def lista_vehiculo(request):
    vehiculo = Vehiculo.objects.all()
    # print(vehiculo)
    return render(request, 'lista_vehiculo.html', {'vehiculos': vehiculo})

def datos_empresa(request):
    empresa = Empresa.objects.all()
    return render(request, 'Datos_Empresa.html', {'empresa': empresa})

def productos(request):
    producto = Productos.objects.all()
    return render(request, 'Productos.html', {'productos': producto})

def servicios(request):
    servicio = Servicios.objects.all()
    return render(request, 'Servicios.html', {'servicios': servicio})