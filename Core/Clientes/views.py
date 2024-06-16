from django.shortcuts import render, redirect, get_object_or_404
from .models import Clientes
from .forms import ClienteForm
from django.http import JsonResponse


#----------VISTA ADMIN CLIENTES------------

def AdClientes(request):
    cliente = Clientes.objects.all()
    return render(request, 'ADMIN/clientes.html', {'clientes':cliente})



#-------------EDITAR CLIENTE---------

def editar_cliente(request, documento):
    cliente = get_object_or_404(Clientes, Documento=documento)

    if request.method == 'POST':
        nombre = request.POST.get('nombre')
        apellido = request.POST.get('apellido')
        celular = request.POST.get('celular')
        f_nacimiento = request.POST.get('f_nacimiento')
        correo = request.POST.get('correo')
        direccion = request.POST.get('direccion')

        cliente.Nombre = nombre
        cliente.Apellido = apellido
        cliente.Celular = celular
        cliente.F_Nacimiento = f_nacimiento
        cliente.Correo = correo
        cliente.Direccion = direccion

        cliente.save()

        return redirect('ad_clientes')

    return render(request, 'ADMIN/editar_cliente.html', {'cliente': cliente})


#--------ELIMINAR----------

def eliminar_cliente(request, documento):
    cliente = get_object_or_404(Clientes, Documento=documento)

    if request.method == 'POST':
        cliente.delete()
        return redirect('ad_clientes')

    return render(request, 'ADMIN/eliminar_cliente.html', {'cliente': cliente})

#-----AGREGAR CLIENTE------------

def agregar_cliente(request):
    if request.method == 'POST':
        form = ClienteForm(request.POST)
        if form.is_valid():
            form.save()
            return JsonResponse({'message': 'Cliente agregado correctamente'})
        else:
            return JsonResponse({'errors': form.errors}, status=400)
    else:
        form = ClienteForm()
    
    return render(request, 'ADMIN/clientes.html', {'form': form})
