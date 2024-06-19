from django.shortcuts import render, redirect, get_object_or_404
from .models import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json

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
