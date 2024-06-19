from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Clientes
from django.contrib.auth import logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

def lista_clientes(request):
    clientes = Clientes.objects.all()
    return render(request, 'lista_clientes.html', {'clientes': clientes})

def AdClientes(request):
    clientes = Clientes.objects.all()
    return render(request, 'ADMIN/clientes.html', {'clientes': clientes})

#-----EDITAR-----------------------

def editar_cliente(request, documento):
    cliente = get_object_or_404(Clientes, Documento=documento)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))

            nombre = data.get('nombre')
            apellido = data.get('apellido')
            celular = data.get('celular')
            f_nacimiento = data.get('f_nacimiento')
            correo = data.get('correo')
            direccion = data.get('direccion')

            # print("Datos recibidos:", data)

            if nombre and apellido and celular and f_nacimiento and correo and direccion:
                cliente.Nombre = nombre
                cliente.Apellido = apellido
                cliente.Celular = celular
                cliente.F_Nacimiento = f_nacimiento
                cliente.Correo = correo
                cliente.Direccion = direccion

                cliente.save()

                return redirect('ad_clientes')
            else:
                return render(request, 'ADMIN/editar_cliente.html', {'cliente': cliente, 'error': 'Todos los campos son obligatorios'})

        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_cliente.html', {'cliente': cliente, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_cliente.html', {'cliente': cliente})

#-----ELIMINAR-----------------------

def eliminar_cliente(request, documento):
    cliente = get_object_or_404(Clientes, Documento=documento)
    
    if request.method == 'POST':
        cliente.delete()
        return JsonResponse({'mensaje': 'Cliente eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_cliente.html', {'cliente': cliente})

#-----AGREGAR------------------------

@csrf_exempt
def agregar_cliente(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        apellido = data.get('apellido')
        documento = data.get('documento')
        celular = data.get('celular')
        f_nacimiento = data.get('f_nacimiento')
        correo = data.get('correo')
        direccion = data.get('direccion')

        if nombre and apellido and documento and celular and f_nacimiento and correo and direccion:
            try:
                nuevo_cliente = Clientes(
                    Nombre=nombre,
                    Apellido=apellido,
                    Documento=documento,
                    Celular=celular,
                    F_Nacimiento=f_nacimiento,
                    Correo=correo,
                    Direccion=direccion
                )
                nuevo_cliente.save()
                return JsonResponse({'message': 'Cliente agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)
