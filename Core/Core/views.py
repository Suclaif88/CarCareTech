from django.contrib.auth import login
from django.shortcuts import render, redirect
from .forms import CustomAuthenticationForm 
from Usuarios.models import Usuarios
from django.contrib import messages


def index(request):
    return render(request, 'index.html')

def about(request):
    return render(request, 'SobreNosotros.html')



def custom_login(request):
    if request.method == 'POST':
        form = CustomAuthenticationForm(request.POST)
        if form.is_valid():
            Documento = form.cleaned_data.get('Documento')
            Rol = form.cleaned_data.get('Rol')
            user = Usuarios.objects.filter(Documento=Documento, Rol=Rol).first()
            if user is not None and user.Rol == 2:
                login(request, user)
                messages.success(request, f'¡Bienvenido, {user.Nombre}! Has iniciado sesión correctamente.')
                return redirect('/admin/')  # Cambia 'Productos' a la URL correcta
    else:
        form = CustomAuthenticationForm()
    return render(request, 'registration/Login.html', {'form': form})


