from django.contrib import admin
from .models import Factura, DetalleProducto, DetalleServicio, MetodoPago

admin.site.register(Factura)

admin.site.register(DetalleProducto)

admin.site.register(DetalleServicio)

admin.site.register(MetodoPago)

# Register your models here.
