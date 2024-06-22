from django.shortcuts import render, redirect, get_object_or_404
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from django.contrib import messages
from Usuarios.models import Usuarios
from .models import Servicios
import json

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
    
def AdServicios(request):
    servicio = Servicios.objects.all()
    return render(request, 'ADMIN/servicios.html', {'servicios': servicio})


#-----EDITAR-----------------------

def editar_servicio(request, id_servicios):
    servicio = get_object_or_404(Servicios, id_servicios=id_servicios)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            
            nombre = data.get('nombre')
            precio = data.get('precio')
            descripcion = data.get('descripcion')
            
            # print("Datos recibidos:", data)

            if nombre and precio and descripcion :
                servicio.nombre = nombre
                servicio.precio = precio
                servicio.descripcion = descripcion


                servicio.save()

                return redirect('ad_servicios')  
            else:
                return render(request, 'ADMIN/editar_servicio.html', {'servicio': servicio})
            
        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_servicio.html', {'servicio': servicio, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_servicio.html', {'servicio': servicio})

#ELIMINAR
def eliminar_servicio(request, id_servicios):
    servicio = get_object_or_404(Servicios, id_servicios=id_servicios)
    
    if request.method == 'POST':
        servicio.delete()
        return JsonResponse({'mensaje': 'Servicio eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_servicio.html', {'servicio': servicio})

#AGREGAR
@csrf_exempt
def agregar_servicio(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        precio = data.get('precio')
        descripcion = data.get('descripcion')

        if nombre and precio and descripcion :
            try:
                nuevo_servicio = Servicios(
                    nombre=nombre,
                    precio=precio,
                    descripcion=descripcion,
                )
                nuevo_servicio.save()
                return JsonResponse({'message': 'Servicio agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)
