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
from Vehiculo.views import  *
from Productos.views import *
from Factura.views import *
from Servicios.views import *

from Empresa.views import datos_empresa
from Servicios.views import servicios

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', index, name='Inicio'),
    path('', home_view, name='home_view'),
    
    path('Productos/', productos, name='Productos'),
    path('Servicios/', servicios, name='Servicios'),
    path('SobreNosotros/',about, name='SobreNosotros'),
    
    path('login/', login_view, name='Login'),
    path('logout/', logout_view, name='logout'),
    path('admin_panel/', admin_view, name='admin_view'),
    
    #URLS DE ADMIN USUARIOS
    path('admin_panel/usuarios/', AdUsuarios, name='ad_usuarios'),
    path('admin_panel/usuarios/editar/<str:documento>/', editar_usuario, name='editar'),
    path('admin_panel/usuarios/eliminar/<str:documento>/', eliminar_usuario, name='eliminar_usuario'),
    path('admin_panel/usuarios/agregar/', agregar_usuario, name='agregar_usuario'),

    #URLS DE ADMIN CLIENTES
    path('admin_panel/clientes/', AdClientes, name='ad_clientes'),
    path('admin_panel/clientes/editar/<str:documento>/', editar_cliente, name='editar_cliente'),
    path('admin_panel/clientes/eliminar/<str:documento>/', eliminar_cliente, name='eliminar_cliente'),
    path('admin_panel/clientes/agregar/', agregar_cliente, name='agregar_cliente'),

    #ADMIN VEHICULOS
    path('admin_panel/vehiculos', AdVehiculos, name='ad_vehiculos'),
    path('admin_panel/clientes/obtener_vehiculos/<str:documento>/', obtener_vehiculos, name='obtener_vehiculos'),
    path('admin_panel/vehiculos/editar/<str:placa>', editar_vehiculo, name='editar_vehiculo'),

    #ADMIN VEHICULOS APARTE
    path('admin_panel/vehiculosa', AdVehiculosA, name='ad_vehiculosa'),
    path('admin_panel/vehiculosa/agregar/', agregar_vehiculosa, name='agregar_vehiculosa'),
    path('admin_panel/vehiculosa/editar/<str:placa>/', editar_vehiculosa, name='editar_vehiculosa'),
    path('admin_panel/vehiculosa/eliminar/<str:placa>/', eliminar_vehiculosa, name='eliminar_vehiculosa'),  
    
    #ADMIN PRODUCTOS
    path('admin_panel/productos', AdProductos, name='ad_productos'),
    path('admin_panel/productos/editar/<str:id_producto>', editar_producto , name='editar_producto'),
    path('admin_panel/productos/eliminar/<str:id_producto>/', eliminar_producto, name='eliminar_producto'),
    path('admin_panel/productos/agregar/', agregar_producto, name='agregar_producto'),

    #ADMIN SERVICIOS
    path('admin_panel/servicios', AdServicios, name='ad_servicios'),
    path('admin_panel/servicios/editar/<str:id_servicios>', editar_servicio , name='editar_servicio'),
    path('admin_panel/servicios/eliminar/<str:id_servicios>/', eliminar_servicio, name='eliminar_servicio'),
    path('admin_panel/servicios/agregar/', agregar_servicio, name='agregar_servicio'),


    #ADMIN FACTURA
    path('admin_panel/factura', AdFactura, name='ad_factura'),
    

        #ADMIN DETALLES SERVICIO
        path('admin_panel/factura/detalle_servicio', AdDServicio, name='detalles_servicio'),
        path('admin_panel/detalle_servicio/eliminar/<int:id_detalle_servicio>/', eliminar_detalle_serv, name='eliminar_detalle_serv'),
        path('admin_panel/detalle_servicio/editar/<str:id_detalle_servicio>/', editar_detalle_serv, name='editar_detalle_serv'),
        path('admin_panel/detalle_servicio/agregar/', agregar_detalle_serv, name='agregar_detalle_serv'),
        path('obtener_precio_servicio/', obtener_precio_servicio, name='obtener_precio_servicio'),
    
        #ADMIN FACTURA DETALLES PRODUCTO
        path('admin_panel/factura/detalle_producto', AdDProducto, name='detalles_producto'),
        

    #------------------------
    path('vehiculos/', lista_vehiculo, name='lista_vehiculo'),#Vistas provicionales para comprobar informacion
    path('datos-empresa/', datos_empresa, name='Datos-Empresa'),#Vistas provicionales para comprobar informacion
    
]
