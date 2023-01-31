from django.contrib import admin
from django.db.models import Q
from functools import reduce

from treenode.admin import TreeNodeModelAdmin
from treenode.forms import TreeNodeForm
from apps.cepalstat.forms import DatoAdminForm

from apps.cepalstat.forms import IndicadorAdminForm
from apps.cepalstat.models import (
    Dimension,
    Indicador,
    Area,
    TipoDimension,
    Dato,
    Fuente,
    Nota,
)


class AreaAdmin(TreeNodeModelAdmin):
    exclude = ('tn_priority',)
    search_fields = ['descripcion']
    # set the changelist display mode: 'accordion', 'breadcrumbs' or 'indentation' (default)
    # when changelist results are filtered by a querystring,
    # 'breadcrumbs' mode will be used (to preserve data display integrity)
    treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_ACCORDION
    # treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_BREADCRUMBS
    # treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_INDENTATION

    # use TreeNodeForm to automatically exclude invalid parent choices
    form = TreeNodeForm

    # inlines = [IndicadorInline, FuenteInline]


admin.site.register(Area, AreaAdmin)


class DimensionAdmin(TreeNodeModelAdmin):
    exclude = ('tn_priority',)
    list_filter = ['descripcion']
    # treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_ACCORDION
    # treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_BREADCRUMBS
    # treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_INDENTATION

    # use TreeNodeForm to automatically exclude invalid parent choices
    form = TreeNodeForm
    treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_ACCORDION


admin.site.register(Dimension, DimensionAdmin)


@admin.register(Dato)
class DatoAdmin(admin.ModelAdmin):
    form = DatoAdminForm
    current_obj = None

    list_display = [
        'indicador',
        'valor',
    ]

    list_filter = ['indicador', 'dimensiones']
    ordering = ['indicador']

    raw_id_fields = ('notas', 'dimensiones')
    autocomplete_lookup_fields = {
        'm2m': ['nota', 'dimensiones'],
    }

    def get_object(self, request, object_id, from_field=None):
        self.current_obj = super(DatoAdmin, self).get_object(
            request, object_id, from_field
        )
        return self.current_obj

    def formfield_for_manytomany(self, db_field, request, **kwargs):
        if db_field.name == 'dimensiones':
            if self.current_obj is not None:
                dimensiones_asociadas = list(
                    self.current_obj.indicador.dimensiones_asociadas.values_list(
                        'id', flat=True
                    )
                )

                if not dimensiones_asociadas:
                    dimensiones_asociadas = []

                # qs = Dimension.objects.filter(
                #     reduce(
                #         lambda x, y: x | y,
                #         [Q(tn_ancestors_pks__contains=dim) for dim in dimensiones_asociadas],
                #         [0, 0],
                #     )
                # )

                kwargs['queryset'] = Dimension.objects.all()  # qs

        return super().formfield_for_manytomany(db_field, request, **kwargs)


@admin.register(Indicador)
class IndicadorAdmin(admin.ModelAdmin):
    form = IndicadorAdminForm
    current_obj = None

    list_display = [
        'descripcion',
        'definicion',
        'unidad_de_medida',
        'nota',
        'publicado',
    ]

    search_fields = ['descripcion', 'definicion', 'nota']
    list_filter = ['descripcion']
    ordering = ['publicado']

    raw_id_fields = ('dimensiones_asociadas', 'areas')
    autocomplete_lookup_fields = {
        'm2m': ['dimensiones_asociadas', 'areas'],
    }

    def get_object(self, request, object_id, from_field=None):
        self.current_obj = super(IndicadorAdmin, self).get_object(
            request, object_id, from_field
        )
        return self.current_obj

    # def formfield_for_manytomany(self, db_field, request, **kwargs):
    #     if db_field.name == "dimensiones_asociadas":
    #         kwargs["queryset"] = Dimension.objects.filter(tn_ancestors_count=0)

    #     return super().formfield_for_manytomany(db_field, request, **kwargs)


@admin.register(Fuente)
class FuenteAdmin(admin.ModelAdmin):
    # list_display = [
    #     "indicador",
    #     "dato",
    # ]

    search_fields = ['nombre_publicacion']
    # ordering = ["indicador"]


@admin.register(Nota)
class NotaAdmin(admin.ModelAdmin):
    # list_display = [
    #     "indicador",
    #     "dato",
    # ]

    search_fields = ['nota']
    ordering = ['nota']
    treenode_display_mode = TreeNodeModelAdmin.TREENODE_DISPLAY_MODE_ACCORDION


@admin.register(TipoDimension)
class TipoDimensionAdmin(admin.ModelAdmin):
    list_filter = ['descripcion']
    # list_display = [
    #     "indicador",
    #     "dato",
    # ]

    # search_fields = ["nombre_publicacion"]
    # ordering = ["indicador"]
