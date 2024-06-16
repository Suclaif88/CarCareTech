from django.contrib.auth.backends import BaseBackend
from django.contrib.auth import get_user_model
from Usuarios.models import Usuarios

class DocumentRoleBackend(BaseBackend):
    def authenticate(self, request, Documento=None, password=None, Rol=None):
        try:
            user = Usuarios.objects.get(Documento=Documento, Rol=Rol)
            if user.check_password(password):
                return user
        except Usuarios.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return Usuarios.objects.get(pk=user_id)
        except Usuarios.DoesNotExist:
            return None
