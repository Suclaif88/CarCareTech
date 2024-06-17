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
from .views import index, about
from Clientes.views import *
from Usuarios.views import *

from Vehiculo.views import  lista_vehiculo
from Empresa.views import datos_empresa
from Productos.views import productos
from Servicios.views import servicios

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', index, name='Inicio'),
    path('Productos/', productos, name='Productos'),
    path('Servicios/', servicios, name='Servicios'),
    path('SobreNosotros/',about, name='SobreNosotros'),
    
    path('login/', login_view, name='Login'),
    path('admin_panel/', admin_view, name='admin_view'),
    path('', home_view, name='home_view'),
    path('logout/', logout_view, name='logout'),
    
    #URLS DE ADMIN USUARIOS
    path('admin_panel/usuarios/', AdUsuarios, name='ad_usuarios'),
    path('admin_panel/usuarios/editar/<str:documento>/', editar_usuario, name='editar'),
    path('admin_panel/usuarios/eliminar/<str:documento>/', eliminar_usuario, name='eliminar_usuario'),
    path('admin_panel/usuarios/agregar/', agregar_usuario, name='agregar_usuario'),

    #URLS DE ADMIN CLIENTES
    path('admin_panel/clientes/', AdClientes, name='ad_clientes'),
    path('admin_panel/clientes/editar/<str:documento>/', editar_cliente, name='editar_cliente'),
    path('admin_panel/clientes/eliminar/<str:documento>/', eliminar_cliente, name='eliminar_cliente'),
    path('clientes/agregar/', agregar_cliente, name='agregar_cliente'),

    
    #URLS DE ADMIN CLIENTES
    path('admin_panel/clientes/', AdClientes, name='ad_clientes'),
    path('admin_panel/clientes/editar/<str:documento>/', editar_cliente, name='editar_cliente'),
    path('admin_panel/clientes/eliminar/<str:documento>/', eliminar_cliente, name='eliminar_cliente'), 
    path('admin_panel/clientes/agregar_cliente/', agregar_cliente, name='agregar_cliente'),
    
    path('vehiculos/', lista_vehiculo, name='lista_vehiculo'),#Vistas provicionales para comprobar informacion
    path('datos-empresa/', datos_empresa, name='Datos-Empresa'),#Vistas provicionales para comprobar informacion
    
]
