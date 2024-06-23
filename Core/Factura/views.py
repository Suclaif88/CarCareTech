from django.shortcuts import render, get_object_or_404
from Vehiculo.models import Vehiculo
from Clientes.models import Clientes
from .models import Factura, DetalleProducto, DetalleServicio, MetodoPago
from Empresa.models import Empresa
from Servicios.models import Servicios
from Productos.models import Productos
from Usuarios.models import Usuarios
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json
import logging
logger = logging.getLogger(__name__)

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

@csrf_exempt
def editar_factura(request, id_factura):
    factura = get_object_or_404(Factura, id_factura=id_factura)
    metodos_pago = MetodoPago.objects.all()
    vehiculos = Vehiculo.objects.all()

    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            factura.fecha = data['fecha']
            factura.Total = data['total']
            factura.Subtotal = data['subtotal']
            factura.Iva = data['iva']
            factura.Descuento = data['descuento']
            factura.nit = Empresa.objects.get(nit=data['nit'])
            factura.placa = Vehiculo.objects.get(placa=data['placa'])
            factura.id_metodo_pago = MetodoPago.objects.get(id_metodo_pago=data['metodo_pago'])
            factura.save()

            return JsonResponse({'success': True})

        except Empresa.DoesNotExist:
            return JsonResponse({'success': False, 'error': 'Empresa no encontrada'})
        except Vehiculo.DoesNotExist:
            return JsonResponse({'success': False, 'error': 'Vehiculo no encontrado'})
        except MetodoPago.DoesNotExist:
            return JsonResponse({'success': False, 'error': 'Metodo de Pago no encontrado'})
        except Exception as e:
            return JsonResponse({'success': False, 'error': str(e)})

    return render(request, 'ADMIN/Factura/editar_factura.html', {'factura': factura, 'metodos_pago': metodos_pago, 'vehiculos': vehiculos})


@csrf_exempt
def eliminar_factura(request, id_factura):
    factura = get_object_or_404(Factura, id_factura=id_factura)

    if request.method == 'POST':
        factura.delete()
        return JsonResponse({'success': True, 'mensaje': 'Factura eliminada correctamente'})

    return render(request, 'ADMIN/Factura/eliminar_factura.html', {'factura': factura})
 

def nueva_factura(request):
    vehiculos = Vehiculo.objects.all()
    clientes = Clientes.objects.all()
    metodos_pago = MetodoPago.objects.all()
    empresas = Empresa.objects.all()
    productos = Productos.objects.all()
    servicios = Servicios.objects.all()
    usuarios = Usuarios.objects.all()
    
    try:
        proximo_id_factura = Factura.objects.latest('id_factura').id_factura + 1
    except Factura.DoesNotExist:
        proximo_id_factura = 1

    context = {
        'vehiculos': vehiculos,
        'clientes': clientes,
        'metodos_pago': metodos_pago,
        'empresas': empresas,
        'productos': productos,
        'servicios': servicios,
        'proximo_id_factura': proximo_id_factura,
        'usuarios': usuarios,
    }

    return render(request, 'ADMIN/Factura/nuevo_factura.html', context)

def obtener_precio_producto(request):
    producto_id = request.GET.get('producto_id')
    if not producto_id:
        return JsonResponse({'error': 'Producto ID no proporcionado'}, status=400)
    try:
        producto = Productos.objects.get(id_producto=producto_id)
        return JsonResponse({'id': producto.id_producto, 'precio': producto.precio})
    except Productos.DoesNotExist:
        return JsonResponse({'error': 'Producto no encontrado'}, status=404)



def obtener_precio_servicio(request):
    servicio_id = request.GET.get('servicio_id')
    servicio = get_object_or_404(Servicios, pk=servicio_id)

    return JsonResponse({'precio': servicio.precio})


@csrf_exempt
def guardar_factura(request):
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            logger.info('Datos recibidos en el backend: %s', data)

            required_fields = ['fecha', 'placa', 'metodoPago', 'nitEmpresa', 'Total', 'Subtotal', 'Iva', 'Descuento']
            for field in required_fields:
                if field not in data:
                    raise KeyError(field)

            numeric_fields = ['Total', 'Subtotal', 'Iva', 'Descuento']
            for field in numeric_fields:
                if not isinstance(data[field], (int, float)):
                    raise ValueError(f'{field} debe ser numérico')
                if data[field] < 0:
                    raise ValueError(f'{field} no puede ser negativo')

            vehiculo = Vehiculo.objects.get(placa=data['placa'])
            metodo_pago = MetodoPago.objects.get(id_metodo_pago=data['metodoPago'])
            empresa = Empresa.objects.get(nit=data['nitEmpresa'])

            # instancia de Factura
            factura = Factura.objects.create(
                fecha=data['fecha'],
                placa=vehiculo,
                id_metodo_pago=metodo_pago,
                nit=empresa,
                Total=data['Total'],
                Subtotal=data['Subtotal'],
                Iva=data['Iva'],
                Descuento=data['Descuento']
            )

            if 'detalles_servicio' in data:
                for detalle_servicio_data in data['detalles_servicio']:
                    servicio_nombre = detalle_servicio_data['servicio']
                    precio = detalle_servicio_data['precio']
                    documento_mecanico_id = detalle_servicio_data['documentoMecanico']

                    servicio = Servicios.objects.get(nombre=servicio_nombre)
                    
                    DetalleServicio.objects.create(
                        factura=factura,
                        servicio=servicio,
                        precio=precio,
                        documento_mecanico_id=documento_mecanico_id
                    )

            if 'detalles_producto' in data:
                for detalle_producto_data in data['detalles_producto']:
                    producto_nombre = detalle_producto_data['producto']
                    cantidad = detalle_producto_data['cantidad']
                    precio_unitario = detalle_producto_data['precio']

                    producto = Productos.objects.get(nombre=producto_nombre)

                    DetalleProducto.objects.create(
                        factura=factura,
                        producto=producto,
                        cantidad=cantidad,
                        precio=precio_unitario
                    )

            return JsonResponse({'success': True, 'id_factura': factura.id_factura})

        except MetodoPago.DoesNotExist:
            error_msg = f'Método de pago con id {data["metodoPago"]} no encontrado'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

        except Servicios.DoesNotExist:
            error_msg = f'Servicio no encontrado'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

        except Productos.DoesNotExist:
            error_msg = f'Producto no encontrado'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

        except KeyError as e:
            error_msg = f'Faltan datos requeridos: {e}'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

        except ValueError as e:
            error_msg = f'Error de valor: {e}'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

        except Exception as e:
            error_msg = f'Error inesperado: {str(e)}'
            logger.error(error_msg)
            return JsonResponse({'success': False, 'error': error_msg})

    else:
        return JsonResponse({'error': 'Método no permitido'}, status=405)



def obtener_detalles(request,id_factura):
    factura = Factura.objects.get(id_factura=id_factura)
    servicios = DetalleServicio.objects.filter(factura=factura).values('servicio__nombre', 'precio', 'documento_mecanico')
    productos = DetalleProducto.objects.filter(factura=factura).values('producto__nombre', 'precio', 'cantidad')
    data = {
        'servicios': list(servicios),
        'productos': list(productos),
    }
    return JsonResponse(data)
'''

Si puedes mantener en su lugar tu cabeza cuando todos a tu alrededor,
han perdido la suya y te culpan de ello.
Si crees en ti mismo cuando todo el mundo duda de ti,
pero también dejas lugar a sus dudas.

Si puedes esperar y no cansarte de la espera;
o si, siendo engañado, no respondes con engaños,
o si, siendo odiado, no te domina el odio
Y aún así no pareces demasiado bueno o demasiado sabio.

'''