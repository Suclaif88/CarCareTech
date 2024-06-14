# Generated by Django 5.0.6 on 2024-06-12 20:11

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='TipoProducto',
            fields=[
                ('id_tipo_producto', models.PositiveSmallIntegerField(primary_key=True, serialize=False)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Productos',
            fields=[
                ('id_producto', models.AutoField(primary_key=True, serialize=False)),
                ('cantidad_stock', models.PositiveSmallIntegerField(default=0)),
                ('nombre', models.CharField(blank=True, max_length=200, null=True)),
                ('precio', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('id_tipo_producto', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='Productos.tipoproducto')),
            ],
        ),
    ]