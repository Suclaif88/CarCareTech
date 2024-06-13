from django.shortcuts import render
from .models import Vehiculo

def lista_vehiculo(request):
    vehiculo = Vehiculo.objects.all()
    return render(request, 'lista_vehiculo.html', {'vehiculos': vehiculo})
