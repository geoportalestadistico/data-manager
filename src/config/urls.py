from django.contrib import admin
from django.urls import path, include
from django.views.generic.base import RedirectView
from django.conf.urls.static import static
from django.conf import settings
from django.views.generic.base import TemplateView
from rest_framework import permissions

from drf_yasg.views import get_schema_view
from drf_yasg import openapi

from api.v1.router import router_modelos
from api.users.views import Login, Logout

schema_view = get_schema_view(
    openapi.Info(
        title='Gestor Estadístico API',
        default_version='v1',
        description='Gestor Estadístico API',
        terms_of_service='https://www.google.com/policies/terms/',
        contact=openapi.Contact(email=''),
        license=openapi.License(name='BSD License'),
    ),
    # public=True,
    # permission_classes=(permissions.IsAdminUser,),
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('grappelli/', include('grappelli.urls')),  # grappelli URLS
    path('admin/', admin.site.urls),
    path('accounts/', include('django.contrib.auth.urls')),
    path(
        '', RedirectView.as_view(url='/admin')
    ),  # Redirige luego del login a la pagina de admin
    path('api/v1/etl/login/', Login.as_view(), name='login'),
    path('api/v1/etl/logout/', Logout.as_view(), name='logout'),
    path('api/v1/', include(router_modelos.urls)),
    path(
        'docs/',
        schema_view.with_ui('swagger', cache_timeout=0),
        name='schema-swagger-ui',
    ),
    # path("redocs/", schema_view.with_ui("redoc", cache_timeout=0), name="schema-redoc"),
]

urlpatterns += static(
    settings.MEDIA_URL, document_root=settings.MEDIA_ROOT
) + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


if settings.DEBUG:

    import debug_toolbar

    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),
    ]


admin.site.site_header = 'Gestor de datos estadísticos'
admin.site.site_title = 'Gestor de datos estadísticos'
admin.site.index_title = 'Administración de la aplicación'
