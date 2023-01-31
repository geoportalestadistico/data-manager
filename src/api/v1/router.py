from rest_framework.routers import DefaultRouter

from api.v1.views import (
    DatoViewSet,
    DimensionViewSet,
    FuenteViewSet,
    IndicadorViewSet,
    AreaViewSet,
    NotaViewSet,
    TipoDimensionViewSet,
    ThematicTreeViewSet,
)


class OptionalSlashRouter(DefaultRouter):
    """Habilita a que sea opcional la barra final en las urls de los viewsets"""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.trailing_slash = '/?'


router_modelos = OptionalSlashRouter()

router_modelos.register('thematic-tree', ThematicTreeViewSet, 'thematic-tree')
router_modelos.register('area', AreaViewSet, 'area')
router_modelos.register('dimension', DimensionViewSet, 'dimension')
router_modelos.register('fuente', FuenteViewSet, 'fuente')
router_modelos.register('nota', NotaViewSet, 'nota')
router_modelos.register('dato', DatoViewSet, 'dato')
router_modelos.register(
    'tipo_dimension', TipoDimensionViewSet, 'tipo_dimension'
)

router_modelos.register('indicator', IndicadorViewSet, 'indicator')
