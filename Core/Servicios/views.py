from django.shortcuts import render, redirect
from django.contrib import messages
from Usuarios.models import Usuarios
from .models import Servicios

def servicios(request):
    servicio = Servicios.objects.all()
    if 'usuario_autenticado' in request.session:
        usuario_id = request.session['usuario_autenticado']
        
        try:
            usuario = Usuarios.objects.get(pk=usuario_id)
            return render(request, 'Servicios.html', {'usuario': usuario, 'servicios': servicio})
        
        except Usuarios.DoesNotExist:
            messages.error(request, 'Usuario no encontrado.')
            return redirect('login_view')
    
    else:
        return render(request, 'Servicios.html', {'servicios': servicio})
