from django.db import models

# Create your models here.
from django.contrib.gis.db import models


class Evacuation(models.Model):
    指定緊急避難場所 = models.CharField(max_length=0)
    所在地 = models.CharField(max_length=0)
    洪水 = models.CharField(max_length=0)
    がけ崩れ、土石流及び地滑り = models.CharField(max_length=0)
    高潮 = models.CharField(max_length=0)
    地震 = models.CharField(max_length=0)
    津波 = models.CharField(max_length=0)
    大規模な火事 = models.CharField(max_length=0)
    内水氾濫 = models.CharField(max_length=0)
    火山現象 = models.CharField(max_length=0)
    geom = models.PointField(srid=4326)#geom変数には避難所の場所を表すポイントデータ(緯度、経度）が格納されます。またSRIDコードは4326を指定しています。