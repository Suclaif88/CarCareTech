from django.shortcuts import render, redirect, get_object_or_404
from .forms import FacturaForm, DetalleProductoForm, DetalleServicioForm

from django.db import models 
from Vehiculo.models import Vehiculo
from Clientes.models import Clientes
from .models import Factura, DetalleProducto, DetalleServicio, MetodoPago
from Empresa.models import Empresa
from Servicios.models import Servicios
from Productos.models import Productos
from Usuarios.models import Usuarios

from django.http import JsonResponse

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
 
 


def nueva_factura(request):
    vehiculos = Vehiculo.objects.all()
    clientes = Clientes.objects.all()
    metodos_pago = MetodoPago.objects.all()
    empresas = Empresa.objects.all()
    productos = Productos.objects.all()
    servicios = Servicios.objects.all()
    usuarios = Usuarios.objects.all()
    
    proximo_id_factura = Factura.objects.latest('id_factura').id_factura + 1

    if request.method == 'POST':
        factura_form = FacturaForm(request.POST)
        detalle_producto_form = DetalleProductoForm(request.POST)
        detalle_servicio_form = DetalleServicioForm(request.POST)

        if factura_form.is_valid() and detalle_producto_form.is_valid() and detalle_servicio_form.is_valid():
            factura = factura_form.save()

            detalle_producto = detalle_producto_form.save(commit=False)
            detalle_producto.factura = factura
            detalle_producto.save()

            detalle_servicio = detalle_servicio_form.save(commit=False)
            detalle_servicio.factura = factura
            detalle_servicio.save()

            subtotal_productos = DetalleProducto.objects.filter(factura=factura).aggregate(total=models.Sum(models.F('precio') * models.F('cantidad')))['total']
            subtotal_servicios = DetalleServicio.objects.filter(factura=factura).aggregate(total=models.Sum('precio'))['total']
            subtotal = (subtotal_productos if subtotal_productos else 0) + (subtotal_servicios if subtotal_servicios else 0)

            factura.Subtotal = subtotal
            factura.save()

            return redirect('ad_factura')

    else:
        factura_form = FacturaForm()
        detalle_producto_form = DetalleProductoForm()
        detalle_servicio_form = DetalleServicioForm()

    context = {
        'factura_form': factura_form,
        'detalle_producto_form': detalle_producto_form,
        'detalle_servicio_form': detalle_servicio_form,
        'vehiculos': vehiculos,
        'clientes': clientes,
        'metodos_pago': metodos_pago,
        'empresas': empresas,
        'productos': productos,
        'servicios': servicios,
        'proximo_id_factura': proximo_id_factura,
        'usuarios': usuarios,
    }
    
    #print(context)

    return render(request, 'ADMIN/Factura/nuevo_factura.html', context)




def obtener_precio_producto(request):
    producto_id = request.GET.get('producto_id')
    try:
        producto = Productos.objects.get(id=producto_id)
        return JsonResponse({'precio': producto.precio})
    except Productos.DoesNotExist:
        return JsonResponse({'error': 'Producto no encontrado'}, status=404)


def obtener_precio_servicio(request):
    servicio_id = request.GET.get('servicio_id')
    servicio = get_object_or_404(Servicios, pk=servicio_id)

    return JsonResponse({'precio': servicio.precio})
