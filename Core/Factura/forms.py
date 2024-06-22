from django import forms
from .models import Factura, DetalleProducto, DetalleServicio

class FacturaForm(forms.ModelForm):
    class Meta:
        model = Factura
        fields = ['fecha', 'placa', 'documento_M', 'id_metodo_pago', 'nit', 'Total', 'Subtotal', 'Iva', 'Descuento']

class DetalleProductoForm(forms.ModelForm):
    class Meta:
        model = DetalleProducto
        fields = ['producto', 'cantidad', 'precio']

class DetalleServicioForm(forms.ModelForm):
    class Meta:
        model = DetalleServicio
        fields = ['servicio', 'precio']
