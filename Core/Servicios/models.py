from django.db import models

class Servicios(models.Model):
    id_servicios = models.AutoField(primary_key=True)
    nombre_servicio = models.CharField(max_length=50, null=True, blank=True)
    precio = models.FloatField(null=True, blank=True)
    descripcion = models.TextField(max_length=1000, null=True, blank=True)
    
    def __str__(self):
        return str(self.nombre_servicio)
