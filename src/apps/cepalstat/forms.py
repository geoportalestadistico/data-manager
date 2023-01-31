from django import forms
from apps.cepalstat.models import Dato, Indicador


class DatoAdminForm(forms.ModelForm):
    min_dimensiones = 2

    class Meta:
        model = Dato
        fields = '__all__'

    def clean(self):
        dimensiones = self.cleaned_data.get('dimensiones', [])
        if len(dimensiones) < self.min_dimensiones:
            raise forms.ValidationError(
                f'Debe seleccionar al menos {self.min_dimensiones} dimensiones'
            )

        indicador = self.cleaned_data.get('indicador')
        for dimension in self.cleaned_data.get('dimensiones', []):
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
                raise forms.ValidationError(
                    {
                        'dimensiones': 'Al menos una dimensión no coincide con la dimensión padre definida en el indicador.'
                    }
                )


class IndicadorAdminForm(forms.ModelForm):
    class Meta:
        model = Indicador
        fields = '__all__'

    # TODO: Limitar el listado que se muestra en el selector para que
    # solo muestre los indicadores que no tienen padre

    def clean(self, *args, **kwargs):
        dimensiones_asociadas = self.cleaned_data.get('dimensiones_asociadas')

        for dimension in dimensiones_asociadas:
            if (dimension.tn_parent_id or 0) > 0:
                raise forms.ValidationError(
                    {
                        'dimensiones_asociadas': [
                            'Las dimensiones asociadas al indicador deben ser raíz, es decir no tener dimensiones superiores',
                        ]
                    }
                )

        return self.cleaned_data
