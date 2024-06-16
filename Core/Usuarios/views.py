from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Usuarios
from django.contrib.auth import logout

def login_view(request):
    if request.method == 'POST':
        documento = request.POST.get('documento')
        
        try:
            usuario = Usuarios.objects.get(Documento=documento)
            request.session['usuario_autenticado'] = usuario.pk
            
            if usuario.Rol == 1:
                return redirect('home_view')
            elif usuario.Rol == 2:
                return redirect('admin_view')
            else:
                return redirect('Inicio')
        
        except Usuarios.DoesNotExist:
            messages.error(request, 'Documento no válido.')
    
    return render(request, 'login.html')


def admin_view(request):
    if 'usuario_autenticado' in request.session:
        usuario_id = request.session['usuario_autenticado']
        try:
            usuario = Usuarios.objects.get(pk=usuario_id)
            return render(request, 'admin_panel.html', {'usuario': usuario})
        except Usuarios.DoesNotExist:
            messages.error(request, 'Usuario no encontrado')
            return redirect('login_view')
    else:
        return redirect('login_view')
    
def home_view(request):
    if 'usuario_autenticado' in request.session:
        usuario_id = request.session['usuario_autenticado']
        
        try:
            usuario = Usuarios.objects.get(pk=usuario_id)
            return render(request, 'index.html', {'usuario': usuario})
        
        except Usuarios.DoesNotExist:
            messages.error(request, 'Usuario no encontrado.')
            return redirect('login_view')
    
    else:
        return redirect('login_view')

def logout_view(request):
    logout(request)
    return redirect('Inicio') 