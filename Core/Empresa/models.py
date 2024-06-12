from django.db import models

class Empresa(models.Model):
    nit = models.CharField(max_length=9, primary_key=True)
    nombre = models.CharField(max_length=100, null=True, blank=True)
    telefono = models.CharField(max_length=30, null=True, blank=True)
    correo = models.CharField(max_length=50, null=True, blank=True)
    direccion = models.CharField(max_length=200, null=True, blank=True)

    def __str__(self):
        return self.nit

