from rest_framework import status
from rest_framework.authentication import get_authorization_header
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer

from api.users.authentication import ExpiringTokenAuthentication


class Authentication(object):
    user = None
    user_token_expired = False

    def get_user(self, request):

        # permitimos a usuarios autenticados (roles permitidos) acceder a los recursos
        if (
            request.user
            # and request.user.is_authenticated
            # and request.user.is_staff
        ):
            return request.user

        token = get_authorization_header(request).split()
        if token and len(token) == 2:
            token = token[1].decode()
            token_expire = ExpiringTokenAuthentication()

            (
                user,
                token,
                message,
                expired,
            ) = token_expire.authenticate_credentials(token)
            if user and token:
                self.user = user
                self.user_token_expired = expired
                return user

            return message

        return None

    def dispatch(self, request, *args, **kwargs):
        user = self.get_user(request)

        if user:
            if type(user) == str:
                response = Response(
                    {'error': user}, status=status.HTTP_401_UNAUTHORIZED
                )
            else:
                return super().dispatch(request, *args, **kwargs)

        else:
            response = Response(
                {'error': 'No se ha encontrado el token de autenticación'},
                status=status.HTTP_400_BAD_REQUEST,
            )

        response.accepted_renderer = JSONRenderer()
        response.accepted_media_type = 'application/json'
        response.renderer_context = {}

        return response
