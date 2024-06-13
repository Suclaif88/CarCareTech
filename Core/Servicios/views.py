from django.shortcuts import render
from .models import Servicios

def servicios(request):
    servicio = Servicios.objects.all()
    return render(request, 'Servicios.html', {'servicios': servicio})
