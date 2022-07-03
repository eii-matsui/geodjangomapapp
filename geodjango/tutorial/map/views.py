from django.shortcuts import render
from django.views import generic
from .models import Evacuation

# Create your views here.

class Home(generic.ListView):
    model = Evacuation
    queryset = Evacuation.objects.all()#テーブルに対して実行するクエリ　省略可能でdefaultで全権取得
    template_name: str = "map/index.html"