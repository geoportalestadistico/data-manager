from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from rest_framework.exceptions import AuthenticationFailed

from datetime import timedelta
from django.utils import timezone
from django.conf import settings


class ExpiringTokenAuthentication(TokenAuthentication):
    """
    If token is expired then it will be removed
    and new one with different key will be created
    """

    expired = False

    def expires_in(self, token):
        time_elapsed = timezone.now() - token.created
        left_time = (
            timedelta(seconds=settings.TOKEN_EXPIRED_AFTER_SECONDS)
            - time_elapsed
        )
        return left_time

    def is_token_expired(self, token):
        return self.expires_in(token) < timedelta(seconds=0)

    def token_expire_handler(self, token):
        # model = self.get_model()

        is_expired = self.is_token_expired(token)
        self.expired = is_expired
        # if is_expired:
        #     print('Token expired')
        #     user = token.user
        #     # token.delete()
        #     # token = model.objects.create(user=user)
        return is_expired, token

    def authenticate_credentials(self, key):
        model = self.get_model()
        user, token, message = None, None, None

        try:
            token = model.objects.select_related('user').get(key=key)
            user = token.user
        except model.DoesNotExist:
            message = 'Token inválido'

        if token and user:
            if not token.user.is_active:
                message = 'El usuario inactivo o eliminado'
            else:
                is_expired, token = self.token_expire_handler(token)
                if is_expired:
                    message = 'El token provisto ha expirado'

        if message:
            user, token = None, None

        return user, token, message, self.expired
