# Generated by Django 5.0.6 on 2024-06-12 21:02

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Productos', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='productos',
            name='id_tipo_producto',
            field=models.ForeignKey(blank=True, db_column='id_tipo_producto', null=True, on_delete=django.db.models.deletion.SET_NULL, to='Productos.tipoproducto'),
        ),
    ]
