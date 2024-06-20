from django import forms
from .models import DetalleServicio

class DetalleServicioForm(forms.ModelForm):
    class Meta:
        model = DetalleServicio
        fields = ['id_factura', 'id_servicio', 'precio', 'documento_mecanico']
