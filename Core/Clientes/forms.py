# forms.py
from django import forms
from .models import Clientes

class ClienteForm(forms.ModelForm):
    class Meta:
        model = Clientes
        fields = ['Nombre', 'Apellido', 'Celular', 'F_Nacimiento', 'Correo', 'Direccion']
