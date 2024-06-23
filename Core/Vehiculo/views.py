from django.shortcuts import render, redirect, get_object_or_404
from .models import *
from Clientes.models import Clientes
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

#TIPOS VEHICULOS
def AdTVehiculos(request):
    tvehiculos = TipoVehiculo.objects.all()
    return render(request, 'ADMIN/tvehiculos.html', {'tvehiculos': tvehiculos})

def editar_tvehiculo(request, id_tipo_vehiculo):
    tvehiculo = get_object_or_404(TipoVehiculo, id_tipo_vehiculo=id_tipo_vehiculo)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            
            nombre = data.get('nombre')
            numero_ruedas = data.get('numero_ruedas')
            descripcion = data.get('descripcion')
            
            # print("Datos recibidos:", data)

            if nombre and numero_ruedas and descripcion:
                tvehiculo.nombre = nombre
                tvehiculo.numero_ruedas = numero_ruedas
                tvehiculo.descripcion = descripcion

                tvehiculo.save()

                return redirect('ad_tvehiculos')  
            else:
                return render(request, 'ADMIN/editar_tvehiculo.html', {'tvehiculo': tvehiculo})
            
        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_tvehiculo.html', {'tvehiculo': tvehiculo, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_tvehiculo.html', {'tvehiculo': tvehiculo})


def eliminar_tvehiculo(request, id_tipo_vehiculo):
    tvehiculo = get_object_or_404(TipoVehiculo, id_tipo_vehiculo=id_tipo_vehiculo)
    
    if request.method == 'POST':
        tvehiculo.delete()
        return JsonResponse({'mensaje': 'Tipo de Vehiculo eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_tvehiculo.html', {'tvehiculo': tvehiculo})


@csrf_exempt
def agregar_tvehiculo(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        numero_ruedas = data.get('numero_ruedas')
        descripcion = data.get('descripcion')


        if nombre and numero_ruedas and descripcion:
            try:
                nuevo_tvehiculo = TipoVehiculo(
                    nombre=nombre,
                    numero_ruedas=numero_ruedas,
                    descripcion=descripcion,
                )
                nuevo_tvehiculo.save()
                return JsonResponse({'message': 'Tipo de Vehiculo agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)


def lista_vehiculo(request):
    vehiculo = Vehiculo.objects.all()
    return render(request, 'lista_vehiculo.html', {'vehiculos': vehiculo})

# views.py
def AdVehiculos(request):
    vehiculos = Vehiculo.objects.all()
    return render(request, 'ADMIN/clientes.html', {'vehiculos': vehiculos})

def obtener_vehiculos(request, documento):
    vehiculos = Vehiculo.objects.filter(documento=documento).values('placa', 'modelo', 'marca', 'color', 'transmision','id_tipo_vehiculo__nombre')
    return JsonResponse(list(vehiculos), safe=False)

def editar_vehiculo(request, placa):
    vehiculo = get_object_or_404(Vehiculo, placa=placa)
    tipos_vehiculo = TipoVehiculo.objects.all()

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))

            modelo = data.get('modelo')
            marca = data.get('marca')
            color = data.get('color')
            transmision = data.get('transmision')
            tipo_vehiculo_id = data.get('tipo_vehiculo')

            if modelo and marca and color and transmision and tipo_vehiculo_id:
                tipo_vehiculo = get_object_or_404(TipoVehiculo, id_tipo_vehiculo=tipo_vehiculo_id)

                vehiculo.modelo = modelo
                vehiculo.marca = marca
                vehiculo.color = color
                vehiculo.transmision = transmision
                vehiculo.id_tipo_vehiculo = tipo_vehiculo

                vehiculo.save()

                return JsonResponse({'success': True})
            else:
                return JsonResponse({'error': 'Todos los campos son obligatorios'}, status=400)

        except Exception as e:
            print("Error al procesar los datos:", e)
            return JsonResponse({'error': 'Error al procesar los datos'}, status=400)

    return render(request, 'admin/editar_vehiculo.html', {'vehiculo': vehiculo, 'tipos_vehiculo': tipos_vehiculo})

#Vehiculos Aparte



def AdVehiculosA(request):
    vehiculos = Vehiculo.objects.all()
    clientes = Clientes.objects.all()
    tipos_vehiculo = TipoVehiculo.objects.all()
    return render(request, 'ADMIN/vehiculos.html', {'vehiculos': vehiculos, 'clientes': clientes, 'tipos_vehiculo': tipos_vehiculo})


@csrf_exempt
def agregar_vehiculosa(request):

    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        placa = data.get('placa')
        modelo = data.get('modelo')
        marca = data.get('marca')
        color = data.get('color')
        transmision = data.get('transmision')
        documento= data.get('documento')
        id_tipo_vehiculo = data.get('id_tipo_vehiculo')

        if placa and modelo and marca and color and transmision and documento and id_tipo_vehiculo:
            try:
                id_tipo_vehiculo = TipoVehiculo.objects.get(pk=id_tipo_vehiculo)
                documento = Clientes.objects.get(pk=documento)
                nuevo_vehiculo = Vehiculo(
                    placa=placa,
                    modelo=modelo,
                    marca=marca,
                    color=color,
                    transmision=transmision,
                    documento=documento,
                    id_tipo_vehiculo=id_tipo_vehiculo
                )
                nuevo_vehiculo.save()
                return JsonResponse({'message': 'Vehículo agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)

def editar_vehiculosa(request, placa):
    vehiculo = get_object_or_404(Vehiculo, placa=placa)
    tipos_vehiculo = TipoVehiculo.objects.all()

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))

            modelo = data.get('modelo')
            marca = data.get('marca')
            color = data.get('color')
            transmision = data.get('transmision')
            tipo_vehiculo_id = data.get('tipo_vehiculo')

            if modelo and marca and color and transmision and tipo_vehiculo_id:
                tipo_vehiculo = get_object_or_404(TipoVehiculo, id_tipo_vehiculo=tipo_vehiculo_id)

                vehiculo.modelo = modelo
                vehiculo.marca = marca
                vehiculo.color = color
                vehiculo.transmision = transmision
                vehiculo.id_tipo_vehiculo = tipo_vehiculo

                vehiculo.save()

                return JsonResponse({'success': True})
            else:
                return JsonResponse({'error': 'Todos los campos son obligatorios'}, status=400)

        except Exception as e:
            print("Error al procesar los datos:", e)
            return JsonResponse({'error': 'Error al procesar los datos'}, status=400)

    return render(request, 'admin/editar_vehiculosa.html', {'vehiculo': vehiculo, 'tipos_vehiculo': tipos_vehiculo})


def eliminar_vehiculosa(request, placa):
    vehiculo = get_object_or_404(Vehiculo, placa=placa)
    
    if request.method == 'POST':
        vehiculo.delete()
        return JsonResponse({'mensaje': 'Vehículo eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_vehiculosa.html', {'vehiculo': vehiculo})
