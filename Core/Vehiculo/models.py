from django.db import models
from Clientes.models import Clientes
class TipoVehiculo(models.Model):
    id_tipo_vehiculo = models.PositiveSmallIntegerField(primary_key=True)
    nombre = models.CharField(max_length=30, null=True, blank=True)
    numero_ruedas = models.PositiveSmallIntegerField(null=True, blank=True)
    descripcion = models.CharField(max_length=2000, null=True, blank=True)

    def __str__(self):
        return str(self.id_tipo_vehiculo)
    
class Vehiculo(models.Model):
    placa = models.CharField(max_length=7, primary_key=True)
    modelo = models.CharField(max_length=25, null=True, blank=True)
    marca = models.CharField(max_length=25, null=True, blank=True)
    color = models.CharField(max_length=25, null=True, blank=True)
    transmision = models.CharField(max_length=30, null=True, blank=True)
    documento = models.ForeignKey(Clientes, on_delete=models.CASCADE, db_column='Documento')
    id_tipo_vehiculo = models.ForeignKey(TipoVehiculo, on_delete=models.CASCADE, db_column='id_tipo_vehiculo')

    def __str__(self):
        return self.placa



