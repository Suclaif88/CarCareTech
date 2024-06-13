from django.shortcuts import render
from .models import Productos

def productos(request):
    producto = Productos.objects.all()
    return render(request, 'Productos.html', {'productos': producto})
