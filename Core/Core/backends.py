from django.contrib.auth.backends import BaseBackend
from Usuarios.models import Usuarios

class DocumentRoleBackend(BaseBackend):
    def authenticate(self, request, documento=None, rol=None):
        try:
            usuario = Usuarios.objects.get(Documento=documento)
            if usuario:
                if rol is not None and usuario.Rol != rol:
                    return None
                return usuario  
        except Usuarios.DoesNotExist:
            return None

    def get_user(self, user_id):
        try:
            return Usuarios.objects.get(pk=user_id)
        except Usuarios.DoesNotExist:
            return None
