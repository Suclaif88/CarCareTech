from django.shortcuts import render
from .models import Clientes

def index(request):
    return render(request, 'index.html')


def lista_clientes(request):
    clientes = Clientes.objects.all()
    print(clientes)
    return render(request, 'lista_clientes.html', {'clientes': clientes})
