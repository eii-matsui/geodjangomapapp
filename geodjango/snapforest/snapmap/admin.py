#from django.contrib import admin
from django.contrib.gis import admin
from snapmap.models import ForestSnapPhoto

admin.site.register(ForestSnapPhoto, admin.GeoModelAdmin)

