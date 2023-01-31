"""
Django settings for gestor_estadistico project.

Generated by 'django-admin startproject' using Django 3.1.7.

For more information on this file, see
https://docs.djangoproject.com/en/3.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.1/ref/settings/
"""
import os
from pathlib import Path
import environ


# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve(strict=True).parent.parent.parent

root = environ.Path(BASE_DIR)
env = environ.Env(DEBUG=(bool, False))
env_file = os.path.join(BASE_DIR, '.env')
environ.Env.read_env(env_file)
env = environ.Env()


SECRET_KEY = env.str(
    'SECRET_KEY', '16n4fdyo1sagec_pv28p@otvp1=033i$_!l!c*b##y58g@3!d$'
)

DEBUG = env.bool('DJANGO_DEBUG', False)

ALLOWED_HOSTS = env.list('ALLOWED_HOSTS')

TEMPLATE_DEBUG = DEBUG

INSTALLED_APPS = [
    'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django_extensions',
    'corsheaders',
    'rest_framework',
    'rest_framework.authtoken',
    'treenode',
    'drf_yasg',
    'apps.cepalstat',
]


MIDDLEWARE = [
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'config.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [BASE_DIR / 'templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'config.wsgi.application'


# Database
# https://docs.djangoproject.com/en/3.1/ref/settings/#databases

DATABASES = {'default': env.db('DATABASE_URL')}

# Password validation
# https://docs.djangoproject.com/en/3.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/3.1/topics/i18n/

LANGUAGE_CODE = 'es-ar'
TIME_ZONE = 'America/Argentina/Buenos_Aires'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# Default primary key field type
# https://docs.djangoproject.com/en/4.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'


public_root = root.path('public')
MEDIA_ROOT = public_root('media')
MEDIA_URL = env.str('MEDIA_URL', default='/media/')
STATIC_ROOT = public_root('static')
STATIC_URL = env.str('STATIC_URL', default='/static/')


# CACHES = {'default': env.cache('REDIS_CACHE_URL')}

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.TokenAuthentication',
    ),
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.IsAuthenticated',
    ),
    'DEFAULT_VERSIONING_CLASS': 'rest_framework.versioning.NamespaceVersioning',
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.LimitOffsetPagination',
    # 'PAGE_SIZE': 3,
}

TOKEN_EXPIRED_AFTER_SECONDS = 60 * 60 * 3   # 3 Horas

LOGIN_URL = '/admin/login/'
# LOGIN_REDIRECT_URL = '/'
LOGOUT_REDIRECT_URL = '/admin/login/'


# APPEND_SLASH = False

SWAGGER_SETTINGS = {
    'LOGIN_URL': '/admin/login/',
    'LOGOUT_URL': '/admin/logout/',
}

CORS_ORIGIN_ALLOW_ALL = False
CORS_ORIGIN_WHITELIST = [
    'http://localhost',
    'http://localhost:8000',
    'http://localhost:3000',
]

GRAPPELLI_ADMIN_TITLE = 'Gestor de datos estadísticos'

CONTEXT = env.str('CONTEXT')
ENVIRONMENT = env.str('ENVIRONMENT')
MACHINE = env.str('MACHINE')
APP_NAME = env.str('APP_NAME')
APP_VERSION = env.str('APP_VERSION')
SHOW_ENDPOINT = env.bool('SHOW_ENDPOINT', False)
SHOW_ENVIRONMENT = env.bool('SHOW_ENVIRONMENT', False)
SHOW_MACHINE = env.bool('SHOW_MACHINE', False)
SHOW_CONTEXT = env.bool('SHOW_CONTEXT', False)
