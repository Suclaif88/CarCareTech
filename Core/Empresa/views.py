from django.shortcuts import render, redirect, get_object_or_404
from .models import Empresa
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import json



def datos_empresa(request):
    empresa = Empresa.objects.all()
    return render(request, 'Datos_Empresa.html', {'empresa': empresa})

def AdEmpresas(request):
    empresas = Empresa.objects.all()
    return render(request, 'ADMIN/empresas.html', {'empresa': empresas})

def editar_empresa(request, nit):
    empresa = get_object_or_404(Empresa, nit=nit)

    if request.method == 'POST':
        try:
            data = json.loads(request.body.decode('utf-8'))
            
            nombre = data.get('nombre')
            telefono = data.get('telefono')
            correo = data.get('correo')
            direccion = data.get('direccion')
            
            # print("Datos recibidos:", data)

            if nombre and telefono and correo and direccion :
                empresa.nombre = nombre
                empresa.telefono = telefono
                empresa.correo = correo
                empresa.direccion = direccion

                empresa.save()

                return redirect('ad_empresa')  
            else:
                return render(request, 'ADMIN/editar_empresa.html', {'empresa': empresa})
            
        except Exception as e:
            print("Error al procesar los datos:", e)
            return render(request, 'ADMIN/editar_empresa.html', {'empresa': empresa, 'error': 'Error al procesar los datos'})

    return render(request, 'ADMIN/editar_empresa.html', {'empresa': empresa})

def eliminar_empresa(request, nit):
    empresa = get_object_or_404(Empresa, nit=nit)
    
    if request.method == 'POST':
        empresa.delete()
        return JsonResponse({'mensaje': 'Empresa eliminada correctamente'})
    return render(request, 'ADMIN/eliminar_empresa.html', {'empresa': empresa})

@csrf_exempt
def agregar_empresa(request):
    if request.method == 'POST':
        data = json.loads(request.body.decode('utf-8'))

        nombre = data.get('nombre')
        nit = data.get('nit')
        telefono = data.get('telefono')
        correo = data.get('correo')
        direccion = data.get('direccion')


        if nombre and nit and telefono and correo and direccion:
            try:
                nueva_empresa = Empresa(
                    nombre=nombre,
                    nit=nit,
                    telefono=telefono,
                    correo=correo,
                    direccion=direccion,

                )
                nueva_empresa.save()
                return JsonResponse({'message': 'Empresa agregada correctamente'}, status=201)
            except Exception as e:
                return JsonResponse({'error': str(e)}, status=500)

    return JsonResponse({'error': 'Método no permitido'}, status=405)
