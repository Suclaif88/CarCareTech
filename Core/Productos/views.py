from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from Usuarios.models import Usuarios
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import *
import json

#TIPO DE PRODUTO

def AdTProductos(request):
    tproductos = TipoProducto.objects.all()
    return render(request, 'ADMIN/tproductos.html', {'tproductos': tproductos})


#-----EDITAR-----------------------

def editar_tproducto(request, id_tipo_producto):
    tproducto = get_object_or_404(TipoProducto, id_tipo_producto=id_tipo_producto)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            
            descripcion = data.get('descripcion')
            
            # print("Datos recibidos:", data)

            if descripcion:
                tproducto.descripcion = descripcion


                tproducto.save()

                return redirect('ad_tproductos')  
            else:
                return render(request, 'ADMIN/editar_tproducto.html', {'tproducto': tproducto})
            
        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_tproducto.html', {'tproducto': tproducto, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_tproducto.html', {'tproducto': tproducto})

#-----ELIMINAR-----------------------

def eliminar_tproducto(request, id_tipo_producto):
    tproducto = get_object_or_404(TipoProducto, id_tipo_producto=id_tipo_producto)
    
    if request.method == 'POST':
        tproducto.delete()
        return JsonResponse({'mensaje': 'Tipo de Producto eliminado correctamente'})
    return render(request, 'ADMIN/eliminar_tproducto.html', {'tproducto': tproducto})


#-----AGREGAR------------------------

@csrf_exempt
def agregar_tproducto(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        descripcion = data.get('descripcion')

        if descripcion:
            try:
                nuevo_tproducto = TipoProducto(
                    descripcion=descripcion,

                )
                nuevo_tproducto.save()
                return JsonResponse({'message': 'Tipo de Producto agregado correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)





















def productos(request):
    producto = Productos.objects.all()
    if 'usuario_autenticado' in request.session:
        usuario_id = request.session['usuario_autenticado']
        
        try:
            usuario = Usuarios.objects.get(pk=usuario_id)
            return render(request, 'Productos.html', {'usuario': usuario, 'productos': producto})
        
        except Usuarios.DoesNotExist:
            messages.error(request, 'Usuario no encontrado.')
            return redirect('login_view')
    
    else:
        return render(request, 'Productos.html', {'productos': producto})
    
def AdProductos(request):
    producto = Productos.objects.all()
    tipos = TipoProducto.objects.all()
    contexto = {
        'productos': producto,
        'tipos': tipos
    }
    return render(request, 'ADMIN/productos.html', contexto)


#-----EDITAR-----------------------

def editar_producto(request, id_producto):
    producto = get_object_or_404(Productos, id_producto=id_producto)
    tipos_productos = TipoProducto.objects.all()

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))

            cantidad_stock = data.get('cantidad_stock')
            nombre = data.get('nombre')
            precio = data.get('precio')
            id_tipo_producto = data.get('id_tipo_producto')

            #print("Datos recibidos:", data)

            if cantidad_stock is not None and nombre and precio and id_tipo_producto:
                producto.cantidad_stock = cantidad_stock
                producto.nombre = nombre
                producto.precio = precio
                producto.id_tipo_producto_id = id_tipo_producto

                producto.save()

                return JsonResponse({'message': 'Producto actualizado correctamente'}, status=200)
            else:
                return JsonResponse({'error': 'Todos los campos son obligatorios'}, status=400)

        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)

    return render(request, 'ADMIN/editar_producto.html', {'producto': producto, 'tipos_productos': tipos_productos})


#-----ELIMINAR-----------------------

def eliminar_producto(request, id_producto):
    producto = get_object_or_404(Productos, id_producto=id_producto)
    
    if request.method == 'POST':
        producto.delete()
        return JsonResponse({'mensaje': 'Producto eliminado correctamente'})
    
    return render(request, 'ADMIN/eliminar_producto.html', {'producto': producto})



#-----AGREGAR------------------------

@csrf_exempt
def agregar_producto(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        cantidad_stock = data.get('cantidad_stock')
        precio = data.get('precio')
        id_tipo_producto = data.get('id_tipo_producto')

        if nombre and cantidad_stock is not None and precio and id_tipo_producto:
            try:
                tipo_producto = TipoProducto.objects.get(pk=id_tipo_producto)

                nuevo_producto = Productos(
                    nombre=nombre,
                    cantidad_stock=cantidad_stock,
                    precio=precio,
                    id_tipo_producto=tipo_producto
                )
                nuevo_producto.save()

                return JsonResponse({'message': 'Producto agregado correctamente'}, status=201)
            except TipoProducto.DoesNotExist:
                return JsonResponse({'error': 'El tipo de producto especificado no existe'}, status=400)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)
        else:
            return JsonResponse({'error': 'Datos incompletos o incorrectos'}, status=400)

    return JsonResponse({'error': 'Método no permitido'}, status=405)