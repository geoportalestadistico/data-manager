from datetime import datetime, timezone

from django.shortcuts import redirect
from django.contrib.sessions.models import Session

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken

from api.users.serializers import UserTokenSerializer


class Login(ObtainAuthToken):
    swagger_schema = None

    def post(self, request, *args, **kwargs):

        login_serializer = self.serializer_class(
            data=request.data, context={'request': request}
        )

        if login_serializer.is_valid():
            user = login_serializer.validated_data['user']
            if user.is_active and user.is_staff:
                token, created = Token.objects.get_or_create(user=user)
                user_serializer = UserTokenSerializer(user)
                if not created:
                    token.delete()
                    token = Token.objects.create(user=user)

                return Response(
                    {
                        'token': token.key,
                        'user': user_serializer.data,
                        'message': 'Inicio de sesión exitoso.',
                    },
                    status=status.HTTP_201_CREATED,
                )
            else:
                return Response(
                    {
                        'mensaje': 'El usuario no tiene los permisos para los recursos solicitados.'
                    },
                    status=status.HTTP_401_UNAUTHORIZED,
                )
        else:
            return Response(
                {'error': 'Usuario o contraseña incorrectos'},
                status=status.HTTP_401_UNAUTHORIZED,
            )

    def get(self, request, *args, **kwargs):
        return redirect('/admin/')


class Logout(APIView):
    swagger_schema = None

    def post(self, request, *args, **kwargs):
        # token en header
        token_recibido = request.auth

        # token en query params
        # token_recibido = request.GET.get('token')

        # token en url
        # token_recibido = kwargs.get('token')
        token = Token.objects.filter(key=token_recibido).first()

        if token:
            user = token.user
            if not user.is_active and not user.is_staff:
                return Response(
                    {
                        'error': 'El usuario no tiene los permisos para los recursos solicitados.'
                    },
                    status=status.HTTP_401_UNAUTHORIZED,
                )

            all_sessions = Session.objects.filter(
                expire_date__gte=datetime.now(timezone.utc).astimezone()
            )
            if all_sessions.exists():
                for session in all_sessions:
                    session_data = session.get_decoded()
                    if user.id == int(session_data.get('_auth_user_id')):
                        session.delete()

            token.delete()

            session_message = 'Se cerraron las sesiones exitosamente.'
            token_message = 'Se eliminó el token exitosamente.'

            return Response(
                {
                    'session_message': session_message,
                    'token_message': token_message,
                },
                status=status.HTTP_200_OK,
            )

        return Response(
            {'error': 'Las credenciales no coinciden con un usuario activo.'},
            status=status.HTTP_200_OK,
        )
