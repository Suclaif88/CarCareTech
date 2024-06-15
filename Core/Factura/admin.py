from django.contrib import admin
from .models import Factura, DetalleProducto, DetalleServicio

admin.site.register(Factura)

admin.site.register(DetalleProducto)

admin.site.register(DetalleServicio)

# Register your models here.
