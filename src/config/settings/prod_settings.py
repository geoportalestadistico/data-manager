import os
from .base_settings import *

DEBUG = False

ALLOWED_HOSTS = [
    'sgo-ub20-geo-d1.cepal.org',
    'localhost',
    '127.0.0.1',
]

MIDDLEWARE += [
    'whitenoise.middleware.WhiteNoiseMiddleware',
]

STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

STATICFILES_DIRS = []
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
