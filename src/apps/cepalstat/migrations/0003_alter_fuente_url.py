# Generated by Django 3.2.10 on 2022-12-13 01:45

import apps.cepalstat.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cepalstat', '0002_alter_dato_dimensiones'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fuente',
            name='url',
            field=models.CharField(blank=True, max_length=250, null=True, validators=[apps.cepalstat.models.OptionalSchemeURLValidator()]),
        ),
    ]
