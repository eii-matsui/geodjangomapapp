# from django.contrib import admin
from django.contrib.gis import admin
from map.models import ForestSnapPhoto
from leaflet.admin import LeafletGeoAdmin

# Register your models here.

# admin.site.registerメソッドを使ってgeomフィールドをマップ表示
admin.site.register(ForestSnapPhoto, LeafletGeoAdmin) 



