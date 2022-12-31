
import os
from map.models import Evacuation, ForestSnapPhoto
from django.contrib.gis.utils.layermapping import LayerMapping
# Django最新バージョンで　LayerMapping　は　layermapping　のモジュールになった

# 関連づけ辞書　｛Djangoのカラム名：geojsonファイルの定義名｝
mapping = {

   'evacuation_site': '指定緊急避難場所',
   'location': '所在地',
   'flood': '洪水',
   'landslides': 'がけ崩れ、土石流及び地滑り',
   'storm_surge' : '高潮',
   'earthquake': '地震',
   'tsunami': '津波',
   'massive_fire': '大規模な火事',
   'inland_flooding': '内水氾濫',
   'valcanic_phenomena': '火山現象',
   'geom' : 'POINT',
}

# ファイルパス
geojson_file = os.path.abspath(
    os.path.join(os.path.dirname(__file__), 'data', '35_yamaguchi_HinanPoint.geojson'))

geojson_file_exif = os.path.abspath(
    os.path.join(os.path.dirname(__file__), 'data', 'Forest_photoImages_20211010_JPG.geojson'))


# layermappingクラスで、geojsonデータとDjangoのModelフィールドの関連づけ（Mapping）を行い、自動的にgeojsonファイルからmodel.pyで定義したテーブルにデータを登録できる
# 実行
def run(verbose=True):
   lm = LayerMapping(Evacuation, geojson_file,    
        mapping=mapping,transform=False, encoding='UTF-8')

   lm.save(strict=True, verbose=True)

   lm = LayerMapping(ForestSnapPhoto, geojson_file_exif,
        transform=False, encoding='UTF-8')
   lm.save(strict=True, verbose=True)


    # strict=Trueにすることで最初に発生したエラーで処理が停止します。


# LayerMappingクラスのパラメータ
# 第1引数：Geojangoの地理モデルクラス
# 第2引数：Geojsonファイルのパス
# 第3引数：Geojsonと地理モデルクラスのマッピング情報
# 第4引数：transform=Falseにすることで座標変換を無効化
# 第5引数：encofingでutf-8を指定


