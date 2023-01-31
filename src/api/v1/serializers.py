from django.forms import ValidationError
from itertools import chain

from rest_framework import serializers

from apps.cepalstat.models import (
    Area,
    Dato,
    Dimension,
    Fuente,
    Indicador,
    Nota,
    TipoDimension,
)


def get_language_field(source, field_name):

    lang = source.context.get('lang', 'es')
    language = ''
    if lang == 'en':
        language = '_ingles'

    if lang == 'pt':
        language = '_portugues'

    if lang == 'fr':
        language = '_frances'

    return f'{field_name}{language}'


def get_translated_field(source, obj, field_name):
    translated_field_name = get_language_field(source, field_name)
    translated_field = None
    if hasattr(obj, translated_field_name):
        translated_field = getattr(obj, translated_field_name)

    return translated_field


# AREA


class AreaSerializer(serializers.ModelSerializer):
    area_padre = serializers.SerializerMethodField()

    class Meta:
        model = Area
        depth = 0
        fields = [
            'id',
            'descripcion',
            'descripcion_larga',
            'descripcion_ingles',
            'descripcion_larga_ingles',
            'descripcion_frances',
            'descripcion_larga_frances',
            'descripcion_portugues',
            'descripcion_larga_portugues',
            'orden',
            'visible',
            'area_padre',
        ]

    def get_area_padre(self, obj):
        return obj.parent.id if obj.parent else None


class AreaSerializerEdit(serializers.ModelSerializer):
    area_padre = serializers.IntegerField(
        allow_null=True, required=False, source='tn_parent.id'
    )

    class Meta:
        model = Area
        depth = 0
        fields = [
            'id',
            'descripcion',
            'descripcion_larga',
            'descripcion_ingles',
            'descripcion_larga_ingles',
            'descripcion_frances',
            'descripcion_larga_frances',
            'descripcion_portugues',
            'descripcion_larga_portugues',
            'orden',
            'visible',
            'area_padre',
        ]

    def get_area_padre(self, obj):
        return obj.parent.id if obj.parent else None

    def validate_area_padre(self, value):

        if not value:
            value = None

        if self.instance and self.instance.id == value:
            raise ValidationError('El área padre no puede ser la propia área.')

        existe = Area.objects.filter(pk=value).first()
        if value and not existe:
            raise ValidationError('El área padre no existe.')
        return value

    def create(self, validated_data):
        dict_parent_id = validated_data.pop('tn_parent')
        parent_id = dict_parent_id.get('id')

        obj = Area(**validated_data)
        if parent_id and Area.objects.filter(pk=parent_id).exists():
            parent = Area.objects.get(pk=parent_id)
            obj.tn_parent = parent

        obj.save()

        return obj

    def update(self, instance, validated_data):
        parent_id = validated_data.pop('tn_parent').get('id')

        if parent_id and Area.objects.filter(pk=parent_id).exists():
            parent = Area.objects.get(pk=parent_id)
            instance.set_parent(parent)

        instance.descripcion = validated_data['descripcion']
        instance.descripcion_larga = validated_data['descripcion_larga']
        instance.descripcion_ingles = validated_data['descripcion_ingles']
        instance.descripcion_larga_ingles = validated_data[
            'descripcion_larga_ingles'
        ]
        instance.descripcion_portugues = validated_data[
            'descripcion_portugues'
        ]
        instance.descripcion_larga_portugues = validated_data[
            'descripcion_larga_portugues'
        ]
        instance.descripcion_frances = validated_data['descripcion_frances']
        instance.descripcion_larga_frances = validated_data[
            'descripcion_larga_frances'
        ]
        instance.orden = validated_data['orden']
        instance.visible = validated_data['visible']
        instance.save()
        return instance


# DIMENSION


class DimensionSerializer(serializers.ModelSerializer):
    members = serializers.SerializerMethodField()
    name = serializers.SerializerMethodField()
    order = serializers.IntegerField(source='orden')
    type = serializers.IntegerField(source='tipo.id')

    class Meta:
        model = Dimension
        depth = 5

        fields = [
            'id',
            'name',
            'type',
            'order',
            'code',
            'sdmx',
            'members',
        ]

    def get_name(self, obj):
        return get_translated_field(self, obj, 'descripcion')

    def get_type(self, obj):
        return get_translated_field(self, obj, 'descripcion')

    def get_members(self, obj):
        aux_dimensiones = {}

        # include_members = self.context.get('include_members', True)
        # print(f'self.context: {self.context}')
        members = list(obj.get_children())

        # if self.context.get('include_members', True):
        #     members = list(obj.get_children())
        # else:
        #     members = []

        if members:
            for dimension in members:
                if dimension.tn_parent_id not in aux_dimensiones:
                    aux_dimensiones[dimension.tn_parent_id] = []

                aux_dimensiones[dimension.tn_parent_id].append(
                    {
                        'id': dimension.id,
                        'name': get_translated_field(
                            self, dimension, 'descripcion'
                        ),
                        'parent': dimension.tn_parent_id,
                        'order': dimension.orden,
                        'code': dimension.code,
                        'sdmx': dimension.sdmx,
                        'members': self.get_members(dimension),
                    }
                )

        result = aux_dimensiones.get(obj.pk, [])
        return result


class DimensionSerializerEdit(serializers.ModelSerializer):
    dimension_padre = serializers.IntegerField(
        allow_null=True, required=False, source='tn_parent.id'
    )

    class Meta:
        model = Dimension
        depth = 0
        fields = [
            'id',
            'descripcion',
            'descripcion_ingles',
            'descripcion_portugues',
            'descripcion_frances',
            'orden',
            'sdmx',
            'code',
            'dimension_padre',
            'tipo',
        ]

    def get_dimension_padre(self, obj):
        return obj.tn_parent.id if obj.tn_parent else None

    def validate_dimension_padre(self, value):
        if not value:
            value = None

        existe = Dimension.objects.filter(pk=value).exists()
        if value and not existe:
            raise ValidationError('La dimensión padre no existe.')
        return value

    def create(self, validated_data):
        dict_parent_id = validated_data.pop('tn_parent')
        parent_id = dict_parent_id.get('id')

        obj = Dimension(**validated_data)
        if parent_id and Dimension.objects.filter(pk=parent_id).exists():
            parent = Dimension.objects.get(pk=parent_id)
            obj.tn_parent = parent

        obj.save()

        return obj

    def update(self, instance, validated_data):
        parent_id = validated_data.pop('tn_parent').get('id')
        if parent_id and Dimension.objects.filter(pk=parent_id).exists():
            parent = Dimension.objects.get(pk=parent_id)
            instance.set_parent(parent)

        instance.descripcion = validated_data['descripcion']
        instance.descripcion_ingles = validated_data['descripcion_ingles']
        instance.descripcion_portugues = validated_data[
            'descripcion_portugues'
        ]
        instance.descripcion_frances = validated_data['descripcion_frances']
        instance.orden = validated_data['orden']
        instance.sdmx = validated_data['sdmx']
        instance.code = validated_data['code']
        instance.tipo = validated_data['tipo']

        instance.save()
        return instance


# TIPO_DIMENSION


class TipoDimensionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoDimension
        fields = '__all__'


# FUENTE


class FuenteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fuente
        fields = '__all__'


# DATO


class DatoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dato
        depth = 0
        fields = [
            'id',
            'valor',
            'valor_cualitativo',
            'indicador',
            'fuente',
            'dimensiones',
            'notas',
        ]


class DatoSerializerEdit(serializers.ModelSerializer):
    class Meta:
        model = Dato
        depth = 0
        fields = [
            'valor',
            'valor_cualitativo',
            'indicador',
            'fuente',
            'dimensiones',
            'notas',
        ]

    def validate(self, data):
        min_dimensiones = 2
        dimensiones_indicador = []
        indicador = data.get('indicador')
        dimensiones_indicador = indicador.dimensiones_asociadas.all()

        # Validar que las dimensiones existan y que coincidan con las del indicador
        dimensiones = data.get('dimensiones', [])
        if len(dimensiones) < min_dimensiones:
            raise ValidationError(
                {
                    'dimensiones': f'Debe ingresar al menos {min_dimensiones} dimensiones'
                }
            )

        for dimension in dimensiones:
            dimensiones_arbol = map(str, dimension.ancestors_pks)
            dimensiones_indicador = map(
                str,
                indicador.dimensiones_asociadas.all().values_list(
                    'id', flat=True
                ),
            )

            coincidencias = list(
                set(dimensiones_arbol).intersection(set(dimensiones_indicador))
            )

            if not coincidencias:
                raise ValidationError(
                    {
                        'dimensiones': 'Al menos una dimensión no coincide con la dimensión padre definida en el indicador.'
                    }
                )

        return data


# NOTA


class NotaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Nota
        fields = '__all__'


# ÁRBOL TEMÁTICO


class IndicadorThematicTreeSerializer(serializers.ModelSerializer):
    indicator_id = serializers.IntegerField(source='id')
    name = serializers.SerializerMethodField()
    order = serializers.CharField(source='orden')

    class Meta:
        model = Indicador
        fields = [
            'indicator_id',
            'name',
            'order',
        ]
        depth = 2

    def get_name(self, obj):
        return get_translated_field(self, obj, 'descripcion')


class ThematicTreeSerializer(serializers.Serializer):
    area_id = serializers.IntegerField(source='id')
    order = serializers.IntegerField(source='orden')
    name = serializers.SerializerMethodField()
    children = serializers.SerializerMethodField()

    class Meta:
        model = Area
        fields = [
            'area_id',
            'order',
            'name',
            'children',
        ]
        depth = 5

    def get_name(self, obj):
        return get_translated_field(self, obj, 'descripcion')

    def get_children(self, obj):
        if obj.indicadores.all().exists():
            return IndicadorThematicTreeSerializer(
                obj.indicadores.all(), many=True, context=self.context
            ).data

        return ThematicTreeSerializer(
            obj.children, many=True, context={'lang': self.context.get('lang')}
        ).data


# INDICADOR


class IndicadorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Indicador
        depth = 0
        fields = '__all__'

    def validate_dimensiones_asociadas(self, value):
        min_dimensiones = 2

        if len(value) < min_dimensiones:
            raise ValidationError(
                {
                    'dimensiones': f'Debe ingresar al menos {min_dimensiones} dimensiones'
                }
            )

        for dimension in value:
            if (dimension.tn_parent_id or 0) > 0:
                raise ValidationError(
                    {
                        'dimensiones_asociadas': [
                            'Las dimensiones asociadas al indicador deben ser raíz, es decir no tener dimensiones superiores',
                        ]
                    }
                )

        return value


# INDICADOR CONSULTA


class DatoIndicadorSerializer(serializers.ModelSerializer):
    metadata = serializers.SerializerMethodField()
    data = serializers.SerializerMethodField()
    dimensions = serializers.SerializerMethodField()
    sources = serializers.SerializerMethodField()
    footnotes = serializers.SerializerMethodField()

    def get_metadata(self, obj):

        metadata = {}
        metadata['indicator_id'] = obj.id
        metadata['indicator_name'] = get_translated_field(
            self, obj, 'descripcion'
        )

        field_name = get_language_field(self, 'descripcion')
        metadata['area'] = obj.areas.all().values_list(field_name, flat=True)
        metadata['note'] = get_translated_field(self, obj, 'nota')
        metadata['unit'] = get_translated_field(self, obj, 'unidad_de_medida')
        metadata['definition'] = get_translated_field(self, obj, 'definicion')
        metadata['calculation_methodology'] = get_translated_field(
            self, obj, 'metodologia_calculo'
        )
        decimals = obj.numero_decimales_consulta
        metadata['last_update'] = obj.fecha_ultima_actualizacion_revision

        return metadata

    def get_data(self, obj):
        str_members = self.context.get('members', '')
        members = []

        try:
            members = list(map(int, str_members.split(',')))
        except:   # pylint: disable=bare-except
            pass

        datos = obj.datos.all()
        for member in members:
            datos = datos.filter(dimensiones__in=[member])

        result = []

        for dato in datos:
            dict_data = {}
            dict_data['id'] = dato.id
            dict_data['value'] = dato.valor
            dict_data['qualitative_value'] = dato.valor_cualitativo
            dict_data['source_id'] = dato.fuente.id

            notes_ids = list(dato.notas.all().values_list('id', flat=True))
            dict_data['notes_ids'] = ', '.join(map(str, notes_ids))

            for d in dato.dimensiones.all():
                dict_data[f'dim_{d.get_root_pk()}'] = d.id

            result.append(dict_data)

        return result

    def get_members(self, obj):
        aux_dimensiones = {}
        members = list(obj.get_children())

        if members:
            for dimension in members:
                if dimension.tn_parent_id not in aux_dimensiones:
                    aux_dimensiones[dimension.tn_parent_id] = []

                aux_dimensiones[dimension.tn_parent_id].append(
                    {
                        'id': dimension.id,
                        'name': get_translated_field(
                            self, dimension, 'descripcion'
                        ),
                        'parent': dimension.tn_parent_id,
                        'order': dimension.orden,
                        'sdmx': dimension.sdmx,
                        'members': self.get_members(dimension),
                    }
                )

        result = aux_dimensiones.get(obj.pk, [])
        return result

    def get_dimensions(self, obj):
        str_members = self.context.get('members', '')
        members = []

        try:
            members = list(map(int, str_members.split(',')))
        except:   # pylint: disable=bare-except
            pass

        if members:
            datos = obj.datos.filter(dimensiones__in=members)
        else:
            datos = obj.datos.all()

        dimensiones = []
        result = []

        for dato in datos:
            dimensiones += list(dato.dimensiones.all())

        for dimension in set(dimensiones):

            result.append(
                {
                    'id': dimension.id,
                    'name': get_translated_field(
                        self, dimension, 'descripcion'
                    ),
                    'parent': dimension.tn_parent_id,
                    'order': dimension.orden,
                    'members': self.get_members(dimension),
                }
            )

        return result

    def get_sources(self, obj):
        fuentes = []

        for dato in obj.datos.all():
            fuentes.append(dato.fuente)

        fuentes = set(fuentes)
        return FuenteSerializer(fuentes, many=True).data

    def get_footnotes(self, obj):
        notas = []

        for dato in obj.datos.all():
            notas += dato.notas.all()

        result = []

        for nota in set(notas):
            result.append(
                {
                    'id': nota.id,
                    'note': get_translated_field(self, nota, 'nota'),
                }
            )
        return result

    class Meta:
        model = Indicador
        fields = [
            'metadata',
            'data',
            'dimensions',
            'sources',
            'footnotes',
            # 'credits',
        ]


class MetadataIndicadorSerializer(serializers.ModelSerializer):
    indicator_id = serializers.CharField(source='id')
    # indicator_name = serializers.CharField(source="descripcion")
    indicator_name = serializers.SerializerMethodField()
    # area = AreaSerializer(source="areas", many=True)
    area = serializers.SerializerMethodField()
    note = serializers.CharField(source='nota')
    unit = serializers.CharField(source='unidad_de_medida')
    definition = serializers.CharField(source='definicion')
    calculation_methodology = serializers.CharField(
        source='metodologia_calculo'
    )
    decimals = serializers.CharField(source='numero_decimales_consulta')
    last_update = serializers.CharField(
        source='fecha_ultima_actualizacion_revision'
    )

    class Meta:
        model = Indicador
        fields = [
            'indicator_id',
            'indicator_name',
            # "theme",
            'area',
            'note',
            'unit',
            'definition',
            # "data_features",
            'calculation_methodology',
            'decimals',
            'last_update',
        ]
        depth = 1

    def get_area(self, obj):
        field_name = get_language_field(self, 'descripcion')
        areas = obj.areas.all().values_list(field_name, flat=True)
        return areas

    def get_indicator_name(self, obj):
        return get_translated_field(self, obj, 'descripcion')


class DimensionIndicadorSerializer(serializers.ModelSerializer):
    indicator_id = serializers.IntegerField(source='id')
    dimensions = serializers.SerializerMethodField()

    class Meta:
        model = Indicador
        depth = 0
        fields = [
            'indicator_id',
            'dimensions',
        ]

    def get_members(self, obj, filtrar=None):
        """Encuentra los miembros de una dimensión y los filtra por el listado de id's que se le pasa.

        Args:
            obj (Dimension): Dimensión a la que se le buscarán los miembros.
            filtrar (list, optional): Listado de id's que se tomarán en cuenta para incluir en el listado. Defaults to None.

        Returns:
            list: listado de miembros filtrados
        """
        members = list(obj.get_children())
        result = []
        if members:
            for dimension in members:
                incluir = len(filtrar) == 0
                dim_bc = dimension.breadcrumbs
                for dim_1 in filtrar:
                    for dim_2 in dim_bc:
                        incluir = dim_1 == dim_2
                        if incluir:
                            break

                    if incluir:
                        break

                if incluir:
                    result.append(
                        {
                            'id': dimension.id,
                            'name': get_translated_field(
                                self, dimension, 'descripcion'
                            ),
                            'parent': dimension.tn_parent_id,
                            'order': dimension.orden,
                            'sdmx': dimension.sdmx,
                        }
                    )

        return result

    def get_dimensions(self, obj):
        roots = []
        dimensiones = []
        resultado = []

        for dato in obj.datos.all():
            dim_dato = Dimension.objects.filter(datos=dato.pk)
            dimensiones += dim_dato

        dimensiones = set(dimensiones)

        for _dim in dimensiones:
            # No usar dimension.get_root() porque es muy lento
            roots.append(int(_dim.get_root_pk()))
        roots = set(roots)

        dimensiones = set(dimensiones)
        for dim_pk in roots:
            dim = Dimension.objects.get(id=dim_pk)
            resultado.append(
                {
                    'id': dim.id,
                    'name': get_translated_field(self, dim, 'descripcion'),
                    'parent': dim.tn_parent_id,
                    'order': dim.orden,
                    'members': self.get_members(dim, filtrar=dimensiones),
                }
            )

        return resultado
