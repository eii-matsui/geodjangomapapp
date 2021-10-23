# from django.contrib import admin
from django.contrib.gis import admin
from map.models import Evacuation

# Register your models here.

# admin.site.registerメソッドを使ってgeomフィールドをマップ表示
admin.site.register(Evacuation, admin.GeoModelAdmin)