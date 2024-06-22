from django.db import models

class Servicios(models.Model):
    id_servicios = models.AutoField(primary_key=True)
    nombre= models.CharField(max_length=50, null=True, blank=True)
    precio = models.DecimalField(null=True, blank=True, decimal_places=0, max_digits=10,)
    descripcion = models.TextField(max_length=1000, null=True, blank=True)
    
    def __str__(self):
        return f'{self.id_servicios} - {self.nombre}'
