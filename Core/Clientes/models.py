from django.db import models

class Clientes(models.Model):
    Documento = models.CharField(max_length=10, primary_key=True)
    Nombre = models.CharField(max_length=25, null=True, blank=True)
    Apellido = models.CharField(max_length=30, null=True, blank=True)
    Celular = models.CharField(max_length=10, null=True, blank=True)
    F_Nacimiento = models.DateField(null=True, blank=True)
    Correo = models.EmailField(max_length=50, null=True, blank=True)
    Direccion = models.CharField(max_length=50, null=True, blank=True)

    def __str__(self):
        return f"{self.Documento}" 

