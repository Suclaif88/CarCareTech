from django.db import models

class TipoProducto(models.Model):
    id_tipo_producto = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return self.descripcion if self.descripcion else str(self.id_tipo_producto)

    
class Productos(models.Model):
    id_producto = models.AutoField(primary_key=True)
    id_tipo_producto = models.ForeignKey(TipoProducto, on_delete=models.SET_NULL, null=True, blank=True, db_column='id_tipo_producto')
    cantidad_stock = models.PositiveSmallIntegerField(default=0)
    nombre = models.CharField(max_length=200, null=True, blank=True)
    precio = models.DecimalField(max_digits=10, decimal_places=0, null=True, blank=True)
    
    def __str__(self):
        return f"{self.nombre} - {self.id_tipo_producto.descripcion if self.id_tipo_producto else 'Sin tipo'}"

    
