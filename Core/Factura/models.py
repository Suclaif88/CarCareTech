from django.db import models
from Usuarios.models import Usuarios
from Productos.models import Productos
from Servicios.models import Servicios
from Vehiculo.models import Vehiculo
from Empresa.models import Empresa

class MetodoPago(models.Model):
    id_metodo_pago = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=50)

    def __str__(self):
        return self.tipo



class Factura(models.Model):
    id_factura = models.AutoField(primary_key=True)
    fecha = models.DateTimeField()
    placa = models.ForeignKey(Vehiculo, on_delete=models.CASCADE, db_column='placa')
    documento_M = models.ForeignKey(Usuarios, on_delete=models.CASCADE, db_column='Documento')
    id_metodo_pago = models.ForeignKey(MetodoPago, on_delete=models.CASCADE, db_column='id_metodo_pago')  # Asegúrate de apuntar a 'id_metodo_pago'
    nit = models.ForeignKey(Empresa, on_delete=models.CASCADE, db_column='nit')
    Total = models.FloatField()
    Subtotal = models.FloatField()
    Iva = models.FloatField()
    Descuento = models.FloatField()

    def __str__(self):
        return f'Factura {self.id_factura} - {self.fecha}'





class DetalleServicio(models.Model):
    id_detalle_servicio = models.AutoField(primary_key=True)
    factura = models.ForeignKey(Factura, on_delete=models.CASCADE, related_name='detalles_servicio')
    servicio = models.ForeignKey(Servicios, on_delete=models.CASCADE)
    precio = models.DecimalField(max_digits=20, decimal_places=0, null=True, blank=True)
    documento_mecanico = models.ForeignKey(
        Usuarios,
        on_delete=models.CASCADE,
        limit_choices_to={'Rol': 1}
    )

    def __str__(self):
        return f'Detalle de Servicio {self.id_detalle_servicio} - Factura: {self.factura}, Servicio: {self.servicio}'

class DetalleProducto(models.Model):
    id_detalle_producto = models.AutoField(primary_key=True)
    factura = models.ForeignKey(Factura, on_delete=models.CASCADE, related_name='detalles_producto')
    producto = models.ForeignKey(Productos, on_delete=models.CASCADE)
    precio = models.FloatField(null=True, blank=True)
    cantidad = models.PositiveSmallIntegerField(null=True, blank=True)

    def __str__(self):
        return f'{self.id_detalle_producto} - Factura: {self.factura}, Producto: {self.producto}'
