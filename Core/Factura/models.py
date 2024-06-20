from django.db import models
from Usuarios.models import Usuarios
from Productos.models import Productos
from Servicios.models import Servicios

class MetodoPago(models.Model):
    id_metodo_pago = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=50)

    def __str__(self):
        return self.tipo
    
class Factura(models.Model):
    id_factura = models.AutoField(primary_key=True)
    fecha = models.DateTimeField()
    placa = models.CharField(max_length=7)
    documento_M = models.CharField(max_length=10)
    id_metodo_pago = models.PositiveSmallIntegerField()
    NIT = models.CharField(max_length=9)
    Total = models.FloatField()
    Subtotal = models.FloatField()
    Iva = models.FloatField()
    Descuento = models.FloatField()

    def __str__(self):
        return f'Factura {self.id_factura} - {self.fecha}'

class DetalleServicio(models.Model):
    id_detalle_servicio = models.AutoField(primary_key=True)
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE, db_column='id_factura')
    id_servicio = models.ForeignKey(Servicios, on_delete=models.CASCADE, db_column='id_servicio')
    precio = models.DecimalField(max_digits=20, decimal_places=0, null=True, blank=True)
    documento_mecanico = models.ForeignKey(
        Usuarios,
        on_delete=models.CASCADE,
        limit_choices_to={'Rol': 1}
    )

    def __str__(self):
        return f'Detalle de Servicio {self.id_detalle_servicio} - Factura: {self.id_factura}, Servicio: {self.id_servicio}'
    
class DetalleProducto(models.Model):

    id_detalle_producto = models.AutoField(primary_key=True)
    id_factura = models.ForeignKey(Factura, on_delete=models.CASCADE, db_column='id_factura')
    id_producto = models.ForeignKey(Productos, on_delete=models.CASCADE, db_column='id_producto')
    precio = models.FloatField(null=True, blank=True)
    cantidad = models.PositiveSmallIntegerField(null=True, blank=True)

    def __str__(self):
        return f'{self.id_detalle_producto} - Factura: {self.id_factura}, Producto: {self.id_producto}'
