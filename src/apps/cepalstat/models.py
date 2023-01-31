from django.db import models
from django.core.validators import URLValidator

from treenode.models import TreeNodeModel


class Area(TreeNodeModel):
    descripcion = models.TextField()
    descripcion_larga = models.TextField(blank=True, null=True)
    descripcion_ingles = models.TextField(blank=True, null=True)
    descripcion_larga_ingles = models.TextField(blank=True, null=True)
    descripcion_frances = models.TextField(blank=True, null=True)
    descripcion_larga_frances = models.TextField(blank=True, null=True)
    descripcion_portugues = models.TextField(blank=True, null=True)
    descripcion_larga_portugues = models.TextField(blank=True, null=True)
    orden = models.SmallIntegerField(default=0)

    visible = models.BooleanField(default=False)

    treenode_display_field = 'descripcion'

    def __str__(self):
        return f'{self.descripcion or self.pk}'


class TipoDimension(models.Model):
    descripcion = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return f'{self.descripcion}'

    class Meta:
        verbose_name = 'Tipo de dimensión'
        verbose_name_plural = 'Tipos de dimensiones'


class Dimension(TreeNodeModel):
    tipo = models.ForeignKey(TipoDimension, on_delete=models.CASCADE)
    descripcion = models.TextField()
    descripcion_ingles = models.TextField(
        max_length=500, blank=True, null=True
    )
    descripcion_frances = models.TextField(
        max_length=500, blank=True, null=True
    )
    descripcion_portugues = models.TextField(
        max_length=500, blank=True, null=True
    )
    orden = models.SmallIntegerField(default=0)
    sdmx = models.TextField(blank=True, null=True)
    code = models.CharField(max_length=50, blank=True, null=True)

    treenode_display_field = 'descripcion'

    # Se modifica para que tome el padre y no la raíz, ya que eso genera consultas
    # adicionales innecesarías, incrementando notablemente la respuesta
    def __str__(self):
        # no utilizar la función .get_root() porque genera errores de recursividad
        raiz = self.parent.descripcion if self.parent else ''
        if self.get_parent_pk() == self.pk:
            raiz = ''
        return f"{raiz} {'->' if raiz else ''} {self.descripcion or self.pk}"

    class Meta:
        verbose_name = 'Dimensión'
        verbose_name_plural = 'Dimensiones'
        ordering = ['descripcion']


class Indicador(models.Model):
    descripcion = models.CharField(max_length=100)
    descripcion_ingles = models.TextField(blank=True, null=True)
    descripcion_frances = models.TextField(blank=True, null=True)
    descripcion_portugues = models.TextField(blank=True, null=True)
    definicion = models.TextField(blank=True, null=True)
    definicion_ingles = models.TextField(blank=True, null=True)
    definicion_frances = models.TextField(blank=True, null=True)
    definicion_portugues = models.TextField(blank=True, null=True)
    unidad_de_medida = models.CharField(max_length=200, blank=True, null=True)
    unidad_de_medida_ingles = models.CharField(
        max_length=200, blank=True, null=True
    )
    unidad_de_medida_frances = models.CharField(
        max_length=200, blank=True, null=True
    )
    unidad_de_medida_portugues = models.CharField(
        max_length=200, blank=True, null=True
    )
    orden = models.SmallIntegerField(blank=True, null=True)
    nota = models.TextField(blank=True, null=True)
    nota_ingles = models.TextField(blank=True, null=True)
    nota_frances = models.TextField(blank=True, null=True)
    nota_portugues = models.TextField(blank=True, null=True)
    comentarios = models.TextField(blank=True, null=True)
    metodologia_calculo = models.TextField(blank=True, null=True)
    indicador_listo = models.BooleanField(default=False)
    tipo_dato = models.TextField(blank=True, null=True)
    tipo_dato_ingles = models.TextField(blank=True, null=True)
    tipo_dato_frances = models.TextField(blank=True, null=True)
    tipo_dato_portugues = models.TextField(blank=True, null=True)
    metodologia_calculo_ingles = models.TextField(blank=True, null=True)
    metodologia_calculo_frances = models.TextField(blank=True, null=True)
    metodologia_calculo_portugues = models.TextField(blank=True, null=True)
    comentarios_ingles = models.TextField(blank=True, null=True)
    comentarios_frances = models.TextField(blank=True, null=True)
    comentarios_portugues = models.TextField(blank=True, null=True)
    numero_decimales_consulta = models.IntegerField(blank=True, null=True)
    fecha_ultima_actualizacion_revision = models.DateTimeField(
        blank=True, null=True
    )
    actualizado_por = models.CharField(max_length=50, blank=True, null=True)
    revisado_por = models.CharField(max_length=50, blank=True, null=True)

    dimensiones_asociadas = models.ManyToManyField(
        Dimension,
        verbose_name='Dimensiones',
        blank=True,
        related_name='indicadores',
    )
    sdmx = models.TextField(blank=True, null=True)
    code = models.CharField(max_length=50, blank=True, null=True)
    areas = models.ManyToManyField(
        Area,
        verbose_name='Area temática',
        blank=True,
        related_name='indicadores',
    )
    publicado = models.BooleanField(default=False)

    def __str__(self):
        return f'{self.descripcion or self.pk}'

    class Meta:
        verbose_name = 'Indicador'
        verbose_name_plural = 'Indicadores'


class OptionalSchemeURLValidator(URLValidator):
    def __call__(self, value):
        if '://' not in value:
            value = 'http://' + value
        super(OptionalSchemeURLValidator, self).__call__(value)


class Fuente(models.Model):
    nombre_publicacion = models.TextField()
    url = models.CharField(
        max_length=250,
        blank=True,
        null=True,
        validators=[OptionalSchemeURLValidator()],
    )
    nombre_publicacion_ingles = models.TextField(blank=True, null=True)
    nombre_publicacion_frances = models.TextField(blank=True, null=True)
    nombre_publicacion_portugues = models.TextField(blank=True, null=True)
    sdmx = models.TextField(blank=True, null=True)
    code = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return f'{self.nombre_publicacion or self.pk}'


class Nota(models.Model):
    nota = models.TextField()
    nota_ingles = models.TextField(blank=True, null=True)
    nota_frances = models.TextField(blank=True, null=True)
    nota_portugues = models.TextField(blank=True, null=True)
    sdmx = models.TextField(blank=True, null=True)
    code = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return f'{self.nota}'


class Dato(models.Model):
    indicador = models.ForeignKey(
        Indicador, on_delete=models.CASCADE, related_name='datos'
    )
    dimensiones = models.ManyToManyField(
        Dimension, verbose_name='Dimensiones', related_name='datos'
    )
    valor = models.DecimalField(
        max_digits=38, decimal_places=22, blank=True, null=True
    )
    valor_cualitativo = models.CharField(max_length=20, blank=True, null=True)
    fuente = models.ForeignKey(Fuente, on_delete=models.CASCADE)
    notas = models.ManyToManyField(
        Nota, blank=True, null=True, verbose_name='Notas'
    )

    # TODO: Modificar esto para cuando se haga el cambio de aplicación
    # notas = models.ManyToManyField(
    #     Nota, verbose_name='Notas'
    # )

    def __str__(self):
        dimensiones = list(
            self.dimensiones.all().values_list('descripcion', flat=True)
        )
        return f"{self.indicador.descripcion or self.pk} - {dimensiones or 'No asignado'}"
