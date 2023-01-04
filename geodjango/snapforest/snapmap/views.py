from django.shortcuts import render
from django.views import generic
from .models import ForestSnapPhoto


# Create your views here.
class Home(generic.ListView):
    model = ForestSnapPhoto
    queryset = ForestSnapPhoto.objects.all()#テーブルに対して実行するクエリ　省略可能でdefaultで全権取得
    template_name: str = "snapmap/index.html"
