from django.shortcuts import render, get_object_or_404
from django.http import JsonResponse
from .models import DetalleServicio, Factura, Servicios, Usuarios, DetalleProducto
from .forms import DetalleServicioForm
from django.views.decorators.csrf import csrf_exempt
import json

def AdFactura(request):
    facturas = Factura.objects.all()
    detalles_servicio = DetalleServicio.objects.all()
    detalles_producto = DetalleProducto.objects.all()

    context = {
        'facturas': facturas,
        'detalles_servicio': detalles_servicio,
        'detalles_producto': detalles_producto,
    }
    
    return render(request, 'ADMIN/Factura/factura.html', context)

#--------DETALLES-SERVICIO-----------

def AdDServicio(request):
    detalle_servicios = DetalleServicio.objects.all()
    servicios = Servicios.objects.all()
    facturas = Factura.objects.all()
    usuarios = Usuarios.objects.filter(Rol=1)
    
    context = {
        'detalles' : detalle_servicios,
        'servicios' : servicios,
        'facturas' : facturas,
        'usuarios' : usuarios,
        }
    
    return render(request, 'ADMIN/Factura/D-Serv/detalle_servicio.html', context)

# --------EDITAR DETALLES-SERVICIO-----------

def editar_detalle_serv(request, id_detalle_servicio):
    detalle_servicio = get_object_or_404(DetalleServicio, id_detalle_servicio=id_detalle_servicio)
    facturas = Factura.objects.all()
    servicios = Servicios.objects.all()
    mecanicos = Usuarios.objects.all()

    if request.method == 'POST':
        form = DetalleServicioForm(request.POST, instance=detalle_servicio)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': 'Detalle de servicio actualizado correctamente'}, status=200)
        else:
            return JsonResponse({'error': form.errors}, status=400)
    else:
        form = DetalleServicioForm(instance=detalle_servicio)

    return render(request, 'ADMIN/Factura/D-Serv/editar_detalle_serv.html', {
        'form': form,
        'detalle': detalle_servicio,
        'facturas': facturas,
        'servicios': servicios,
        'mecanicos': mecanicos
    })


#--------ELIMINAR DETALLES-SERVICIO-----------
def eliminar_detalle_serv(request, id_detalle_servicio):
    detalle_servicio = get_object_or_404(DetalleServicio, id_detalle_servicio=id_detalle_servicio)
    
    if request.method == 'POST':
        detalle_servicio.delete()
        return JsonResponse({'message': 'Detalle de servicio eliminado correctamente'})
    
    context = {
        'detalle': detalle_servicio
    }
    return render(request, 'ADMIN/Factura/D-Serv/eliminar_detalle_serv.html', context)


#-----AGREGAR DETALLES-SERVICIO------------------------

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import DetalleServicio, Factura, Servicios, Usuarios
import json

@csrf_exempt
def agregar_detalle_serv(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            # print('Datos recibidos:', data)

            factura_id = data.get('factura')
            servicio_id = data.get('servicio')
            precio = data.get('precio')
            documento_mecanico = data.get('documento_mecanico')

            # Verificar que todos los datos necesarios estén presentes
            if factura_id is not None and servicio_id is not None and precio is not None and documento_mecanico is not None:
                # print(f'factura_id: {factura_id}, servicio_id: {servicio_id}, precio: {precio}, documento_mecanico: {documento_mecanico}')

                # Obtener objetos relacionados
                factura = Factura.objects.get(id_factura=factura_id)
                servicio = Servicios.objects.get(id_servicios=servicio_id)
                usuario_mecanico = Usuarios.objects.get(Documento=documento_mecanico)

                # print(f'Factura encontrada: {factura}')
                # print(f'Servicio encontrado: {servicio}')
                # print(f'Usuario mecánico encontrado: {usuario_mecanico}')

                # Crear nuevo detalle de servicio
                nuevo_detalle_servicio = DetalleServicio(
                    id_factura=factura,
                    id_servicio=servicio,
                    precio=precio,
                    documento_mecanico=usuario_mecanico
                )
                nuevo_detalle_servicio.save()

                print('Detalle de servicio creado correctamente')

                return JsonResponse({'message': 'Detalle de servicio agregado correctamente'}, status=201)

            else:
                return JsonResponse({'error': 'Datos incompletos o incorrectos'}, status=400)

        except Factura.DoesNotExist:
            return JsonResponse({'error': 'La factura especificada no existe'}, status=400)

        except Servicios.DoesNotExist:
            return JsonResponse({'error': 'El servicio especificado no existe'}, status=400)

        except Usuarios.DoesNotExist:
            return JsonResponse({'error': 'El usuario mecánico especificado no existe'}, status=400)

        except Exception as e:
            print(f'Error al crear el detalle de servicio: {str(e)}')
            return JsonResponse({'error': str(e)}, status=500)

    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)




    
#----------OBTENER EL PRECIO DEL SERVICIO----------

def obtener_precio_servicio(request):
    servicio_id = request.GET.get('servicio_id')
    servicio = get_object_or_404(Servicios, pk=servicio_id)

    return JsonResponse({'precio': servicio.precio})


#--------DETALLES-PRODUCTO-----------

def AdDProducto(request):
    detalle_producto = DetalleProducto.objects.all()
    return render(request, 'ADMIN/Factura/detalle_producto.html', {'detalles' : detalle_producto})