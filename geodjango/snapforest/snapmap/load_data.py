
import os
from snapmap.models import ForestSnapPhoto
from django.contrib.gis.utils.layermapping import LayerMapping
# Django最新バージョンで　LayerMapping　は　layermapping　のモジュールになった


# 関連づけ辞書　｛Djangoのカラム名：geojsonファイルの定義名｝
mapping = {

   'image_FilePath': 'image_FilePath',
   'image_DateTime': 'image_DateTime',
   'image_Width': 'image_Width',
   'image_Height': 'image_Height',
   'geom' : 'POINT',
}


# ファイルパス
geojson_file_exif = os.path.abspath(
    os.path.join(os.path.dirname(__file__), 'data', 'Forest_photoImages_20211010_JPG2.geojson'))


# layermappingクラスで、geojsonデータとDjangoのModelフィールドの関連づけ（Mapping）を行い、自動的にgeojsonファイルからmodel.pyで定義したテーブルにデータを登録できる
# 実行
def run(verbose=True):
   lm = LayerMapping(ForestSnapPhoto, geojson_file_exif,
        mapping=mapping,transform=False, encoding='UTF-8')
   lm.save(strict=False, verbose=True)


    # strict=Trueにすることで最初に発生したエラーで処理が停止します。


# LayerMappingクラスのパラメータ
# 第1引数：Geojangoの地理モデルクラス
# 第2引数：Geojsonファイルのパス
# 第3引数：Geojsonと地理モデルクラスのマッピング情報
# 第4引数：transform=Falseにすることで座標変換を無効化
# 第5引数：encofingでutf-8を指定


