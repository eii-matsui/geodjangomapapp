from django.contrib.gis.db import models


# Create your models here.


class ForestSnapPhoto(models.Model):
    
    # image_FilePath    ：元の画像保管パス
    # image_DateTime    ：画像撮影日
    # image_Width       ：画像の幅　ｘ
    # image_Height      ：画像の高さ　ｙ
    # FocalLength       ：焦点距離

    image_FilePath = models.CharField(max_length=255)
    image_DateTime = models.CharField(max_length=255)
    # image_DateTime = models.DateTimeField(help_text="Photo DateTime")
    image_Width = models.CharField(max_length=255)
    image_Height = models.CharField(max_length=255)
    FocalLength = models.CharField(max_length=255)
    geom = models.PointField(srid=4326)   #geom変数には避難所の場所を表すポイントデータ(緯度、経度）が格納されます。またSRIDコードは4326を指定しています。


    def __str__(self):
        return self.image_DateTime
