from django import forms
from django.contrib.auth.forms import AuthenticationForm

class CustomAuthenticationForm(AuthenticationForm):
    Documento = forms.CharField(max_length=10, label='Documento')
    Rol = forms.ChoiceField(choices=[(1, 'Mecanico'), (2, 'Admin')], label='Rol')

    def __init__(self, *args, **kwargs):
        super(CustomAuthenticationForm, self).__init__(*args, **kwargs)
        if 'username' in self.fields:
            self.fields.pop('username')
        if 'password' in self.fields:
            self.fields.pop('password')
