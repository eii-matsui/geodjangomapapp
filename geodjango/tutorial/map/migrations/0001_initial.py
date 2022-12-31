# Generated by Django 3.2.8 on 2021-10-23 15:59

import django.contrib.gis.db.models.fields
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Evacuation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('evacuation_site', models.CharField(max_length=255)),
                ('location', models.CharField(max_length=255)),
                ('flood', models.CharField(max_length=255)),
                ('landslides', models.CharField(max_length=255)),
                ('storm_surge', models.CharField(max_length=255)),
                ('earthquake', models.CharField(max_length=255)),
                ('tsunami', models.CharField(max_length=255)),
                ('massive_fire', models.CharField(max_length=255)),
                ('inland_flooding', models.CharField(max_length=255)),
                ('valcanic_phenomena', models.CharField(max_length=255)),
                ('geom', django.contrib.gis.db.models.fields.PointField(srid=4326)),
            ],
        ),
        migrations.CreateModel(
            name='ForestSnapPhoto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image_FilePath', models.CharField(max_length=255)),
                ('image_DateTime', models.CharField(max_length=255)),
                ('image_Width', models.CharField(max_length=255)),
                ('image_Height', models.CharField(max_length=255)),
                ('geom', django.contrib.gis.db.models.fields.PointField(srid=4326)),
            ],
        ),        
    ]
