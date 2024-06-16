from django.db import models

class Usuarios(models.Model):
    Elegir_Rol = [
        (1, 'Mecánico'),
        (2, 'Administrador'),
    ]
    
    Documento = models.CharField(max_length=10, primary_key=True)
    Nombre = models.CharField(max_length=25, null=True, blank=True)
    Apellido = models.CharField(max_length=30, null=True, blank=True)
    Celular = models.CharField(max_length=10, null=True, blank=True)
    F_Nacimiento = models.DateField(null=True, blank=True)
    Correo = models.EmailField(max_length=50, null=True, blank=True)
    Rol = models.IntegerField(choices=Elegir_Rol, default=1, null=True, blank=True)

    def __str__(self):
        return f"{self.Documento} - {self.Nombre}"



