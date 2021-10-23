# Geodjangoではdjango.dbではなくdjango.contrib.gis.db内のmodelsを利用します。そのため以下はコメントアウト
# from django.db import models

# Create your models here.
from django.contrib.gis.db import models


class Evacuation(models.Model):
    
    # ・max_lengthは一律0→255に変更
    # ・カラム名が日本語になっている部分は以下のようにアルファベットに変更
    # 指定緊急避難場所 →　evacuation_site
    # 所在地 →　location
    # 洪水 →　flood
    # がけ崩れ、土石流及び地滑り →　landslides
    # 高潮 →　storm_surge
    # 地震 →　earthquake
    # 津波 →　tsunami
    # 大規模な火事 →　massive_fire
    # 内水氾濫 →　inland_flooding
    # 火山現象 →　volcanic_phenomena
    # ※geomはそのまま

    evacuation_site = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    flood = models.CharField(max_length=255)
    landslides = models.CharField(max_length=255)
    storm_surge = models.CharField(max_length=255)
    earthquake = models.CharField(max_length=255)
    tsunami = models.CharField(max_length=255)
    massive_fire = models.CharField(max_length=255)
    inland_flooding = models.CharField(max_length=255)
    valcanic_phenomena = models.CharField(max_length=255)
    geom = models.PointField(srid=4326)   #geom変数には避難所の場所を表すポイントデータ(緯度、経度）が格納されます。またSRIDコードは4326を指定しています。


    def __str__(self):
        return self.evacuation_site
        