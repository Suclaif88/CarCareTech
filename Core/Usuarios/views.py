from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Usuarios
from django.contrib.auth import logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json


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
            return render(request, 'ADMIN/admin_panel.html', {'usuario': usuario})
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

#-------Vistas Admin Usuario--------------

def AdUsuarios(request):
    usuarios = Usuarios.objects.all()
    return render(request, 'ADMIN/usuarios.html', {'usuarios': usuarios})


#-----EDITAR-----------------------

def editar_usuario(request, documento):
    usuario = get_object_or_404(Usuarios, Documento=documento)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            
            nombre = data.get('nombre')
            apellido = data.get('apellido')
            celular = data.get('celular')
            f_nacimiento = data.get('f_nacimiento')
            correo = data.get('correo')
            rol = data.get('rol')
            
            # print("Datos recibidos:", data)

            if nombre and apellido and celular and f_nacimiento and correo and rol:
                usuario.Nombre = nombre
                usuario.Apellido = apellido
                usuario.Celular = celular
                usuario.F_Nacimiento = f_nacimiento
                usuario.Correo = correo
                usuario.Rol = rol

                usuario.save()

                return redirect('ad_usuarios')  
            else:
                return render(request, 'ADMIN/editar_usuario.html', {'usuario': usuario})
            
        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_usuario.html', {'usuario': usuario, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_usuario.html', {'usuario': usuario})

#-----ELIMINAR-----------------------

def eliminar_usuario(request, documento):
    usuario = get_object_or_404(Usuarios, Documento=documento)
    
    if request.method == 'POST':
        usuario.delete()
        return JsonResponse({'mensaje': 'Usuario eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_usuario.html', {'usuario': usuario})


#-----AGREGAR------------------------

@csrf_exempt
def agregar_usuario(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        apellido = data.get('apellido')
        documento = data.get('documento')
        celular = data.get('celular')
        f_nacimiento = data.get('f_nacimiento')
        correo = data.get('correo')
        rol = data.get('rol')

        if nombre and apellido and documento and celular and f_nacimiento and correo and rol:
            try:
                nuevo_usuario = Usuarios(
                    Nombre=nombre,
                    Apellido=apellido,
                    Documento=documento,
                    Celular=celular,
                    F_Nacimiento=f_nacimiento,
                    Correo=correo,
                    Rol=rol
                )
                nuevo_usuario.save()
                return JsonResponse({'message': 'Usuario agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)

