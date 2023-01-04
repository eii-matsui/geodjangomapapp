#from django.contrib import admin
from django.contrib.gis import admin
from snapmap.models import ForestSnapPhoto
from leaflet.admin import LeafletGeoAdmin   

admin.site.register(ForestSnapPhoto, LeafletGeoAdmin) 