from datetime import datetime

from django.shortcuts import get_object_or_404, get_list_or_404
from django.utils.timezone import utc
from rest_framework.permissions import (
    IsAuthenticatedOrReadOnly,
    IsAuthenticated,
    IsAdminUser,
    AllowAny,
)
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from rest_framework.decorators import action


from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema


from api.users.authentication_mixins import Authentication

from api.v1.serializers import (
    AreaSerializerEdit,
    DatoSerializer,
    DatoIndicadorSerializer,
    DimensionSerializer,
    DimensionSerializerEdit,
    DimensionIndicadorSerializer,
    IndicadorSerializer,
    FuenteSerializer,
    AreaSerializer,
    NotaSerializer,
    TipoDimensionSerializer,
    ThematicTreeSerializer,
    MetadataIndicadorSerializer,
    DatoSerializerEdit,
)

from apps.cepalstat.models import (
    Area,
    Dato,
    Dimension,
    Indicador,
    Fuente,
    Nota,
    TipoDimension,
)

from api.v1.utils import get_header, get_footer


lang = openapi.Parameter(
    'lang',
    in_=openapi.IN_QUERY,
    type=openapi.TYPE_ARRAY,
    items=openapi.Items(
        type=openapi.TYPE_STRING, enum=['es', 'en', 'pt', 'fr']
    ),
    required=False,
)

include_members = openapi.Parameter(
    'include_members',
    in_=openapi.IN_QUERY,
    type=openapi.TYPE_BOOLEAN,
    required=False,
)

members = openapi.Parameter(
    'members',
    in_=openapi.IN_QUERY,
    type=openapi.TYPE_STRING,
    required=False,
    description='Lista de desagregaciones separadas por coma que constituyen el filtro',
)


def default_permission(request):
    print(f'request.method:{request.method}')
    if request.method == 'GET':
        return [AllowAny()]
    else:
        return [IsAdminUser()]


class AreaViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAdminUser]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Area.objects.all()
    serializer_class = AreaSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)

    def get_serializer_class(self):
        if self.action in ['create', 'update']:
            return AreaSerializerEdit
        return self.serializer_class


class DatoViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Dato.objects.all()
    serializer_class = DatoSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)

    def get_serializer_class(self):
        if self.action in ['create', 'update']:
            return DatoSerializerEdit
        return self.serializer_class


class DimensionViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Dimension.objects.all()
    serializer_class = DimensionSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)

    def get_serializer_class(self):
        if self.action in ['create', 'update']:
            return DimensionSerializerEdit

        return self.serializer_class

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({'lang': self.request.query_params.get('lang', 'es')})
        context.update(
            {
                'include_members': self.request.query_params.get(
                    'include_members', True
                )
            }
        )
        return context

    @swagger_auto_schema(manual_parameters=[lang, include_members])
    def retrieve(self, request, *args, **kwargs):

        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_object_or_404(
            Dimension, pk=self.kwargs.get('pk'), tn_parent=None
        )

        serializer = self.get_serializer(queryset)
        header = get_header(True, 200, '')

        body = {'dimensions': serializer.data}
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}

        return Response(root)

    @swagger_auto_schema(manual_parameters=[lang, include_members])
    def list(self, request, *args, **kwargs):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_list_or_404(Dimension, tn_parent=None)

        serializer = DimensionSerializer(
            queryset,
            many=True,
            context={
                'lang': self.request.query_params.get('lang', 'es'),
                'include_members': self.request.query_params.get(
                    'include_members', True
                ),
            },
        )
        header = get_header(True, 200, '')

        body = {'dimensions': serializer.data}
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}

        return Response(root)


class FuenteViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Fuente.objects.all()
    serializer_class = FuenteSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)


class NotaViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Nota.objects.all()
    serializer_class = NotaSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)


class TipoDimensionViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticated]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = TipoDimension.objects.all()
    serializer_class = TipoDimensionSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)


class ThematicTreeViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    http_method_names = ['get']
    queryset = Area.objects.all()
    serializer_class = ThematicTreeSerializer
    lookup_field = 'pk'

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({'lang': self.request.query_params.get('lang', 'es')})
        return context

    @swagger_auto_schema(manual_parameters=[lang])
    def retrieve(self, request, *args, **kwargs):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_object_or_404(
            Area, pk=self.kwargs.get('pk'), tn_parent=None
        )

        serializer = self.get_serializer(queryset)
        header = get_header(True, 200, '')

        body = serializer.data
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}

        return Response(root)

    @swagger_auto_schema(manual_parameters=[lang])
    def list(self, request, *args, **kwargs):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_list_or_404(Area, tn_parent=None)

        serializer = ThematicTreeSerializer(queryset, many=True)
        header = get_header(True, 200, '')

        body = serializer.data
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}

        return Response(root)


class IndicadorViewSet(Authentication, ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    http_method_names = ['get', 'put', 'post', 'delete']
    queryset = Indicador.objects.all()
    serializer_class = IndicadorSerializer
    lookup_field = 'pk'

    def get_permissions(self, *args, **kwargs):
        return default_permission(self.request)

    @swagger_auto_schema(manual_parameters=[lang])
    @action(
        methods=['get'],
        detail=True,
        # permission_classes=[IsAdminOrIsSelf],
        url_path='dimensions',
        url_name='dimensions',
    )
    def get_dimensions(self, request, pk=None):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_object_or_404(Indicador, id=pk)
        serializer = DimensionIndicadorSerializer(
            queryset,
            context={'lang': self.request.query_params.get('lang', 'es')},
        )

        header = get_header(True, 200, '')
        body = serializer.data
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}
        return Response(root)

    @swagger_auto_schema(manual_parameters=[lang])
    @action(
        methods=['get'],
        detail=True,
        # permission_classes=[IsAdminOrIsSelf],
        url_path='metadata',
        url_name='metadata',
    )
    def get_metadata(self, request, pk=None):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_object_or_404(Indicador, id=pk)
        serializer = MetadataIndicadorSerializer(
            queryset,
            context={'lang': self.request.query_params.get('lang', 'es')},
        )

        header = get_header(True, 200, '')
        body = {'metadata': serializer.data}
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}
        return Response(root)

    def get_serializer_context(self):
        context = super().get_serializer_context()
        context.update({'lang': self.request.query_params.get('lang', 'es')})
        context.update({'members': self.request.query_params.get('members')})
        return context

    @swagger_auto_schema(manual_parameters=[lang, members])
    @action(
        methods=['get'],
        detail=True,
        url_path='data',
        url_name='data',
    )
    def get_data(self, request, pk=None):
        request_started_at = datetime.utcnow().replace(tzinfo=utc)
        queryset = get_object_or_404(Indicador, id=pk)
        serializer = DatoIndicadorSerializer(
            queryset,
            context={
                'lang': self.request.query_params.get('lang', 'es'),
                'members': self.request.query_params.get('members'),
            },
        )
        header = get_header(True, 200, '')
        body = serializer.data
        footer = get_footer(request, len(serializer.data), request_started_at)
        root = {'header': header, 'body': body, 'footer': footer}
        return Response(root)
