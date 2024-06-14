"""
URL configuration for Core project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .views import index, about, login, registro
from Clientes.views import lista_clientes

from Vehiculo.views import  lista_vehiculo
from Empresa.views import datos_empresa
from Productos.views import productos
from Servicios.views import servicios

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index),
    path('', index, name='Inicio'),
    path('Productos/', productos, name='Productos'),
    path('Servicios/', servicios, name='Servicios'),
    path('SobreNosotros/',about, name='SobreNosotros'),
    path('Ingreso/', login, name='Login'),
    path('Registro/', registro, name='Registro'),
    
    
    path('clientes/', lista_clientes, name='lista_clientes'),#Vistas provicionales para comprobar informacion
    path('vehiculos/', lista_vehiculo, name='lista_vehiculo'),#Vistas provicionales para comprobar informacion
    path('datos-empresa/', datos_empresa, name='Datos-Empresa'),#Vistas provicionales para comprobar informacion
    
]
