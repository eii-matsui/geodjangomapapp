# This is an auto-generated Django model module created by ogrinspect.
from django.contrib.gis.db import models


class ForestSnapPhoto(models.Model):
    image_filepath = models.CharField(max_length=0)
    image_datetime = models.DateTimeField()
    image_width = models.CharField(max_length=0)
    image_height = models.CharField(max_length=0)
    focallength = models.CharField(max_length=0)
    geom = models.PointField(srid=4326)