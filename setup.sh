
mkdir venv

cd venv

pytohn -m venv

# venv geodjango
geodjango\Scripts\activate.bat



mkdir geodjango
cd geodjango

django-admin startproject tutorial

cd tutorial

python manage.py startapp map



# setting.pyのDATABASEを変更した後、マイグレーション
#   \geodjangomapapp\geodjango\tutorial>
python manage.py makemigrations
# 正常終了の動作結果は下記
# No changes detecte 

# #新バージョンのDjangoではこのエラーは起こらない
#   File "C:\geodjango\venv\geodjango\lib\site-packages\django\contrib\gis\gdal\libgdal.py", line 43, in <module>
#    % '", "'.join(lib_names)
# django.core.exceptions.ImproperlyConfigured: Could not find the GDAL library (tried "gdal203", "gdal202", "gdal201", "gdal20", "gdal111"). Is GDAL installed? If it is, try setting GDAL_LIBRARY_PATH in your settings.
#　「C:\geodjango\venv\geodjango\Lib\site-packages\django\contrib\gis\gdal\libgdal.py」ファイルをエディタで開き以下のようにlib_namesに「gdal300」を追加します。



python manage.py migrate
# Operations to perform:
#   Apply all migrations: admin, auth, contenttypes, sessions
# Running migrations:
#   Applying contenttypes.0001_initial... OK
#   Applying auth.0001_initial... OK
#   Applying admin.0001_initial... OK
#   Applying admin.0002_logentry_remove_auto_add... OK
#   Applying admin.0003_logentry_add_action_flag_choices... OK
#   Applying contenttypes.0002_remove_content_type_name... OK
#   Applying auth.0002_alter_permission_name_max_length... OK
#   Applying auth.0003_alter_user_email_max_length... OK
#   Applying auth.0004_alter_user_username_opts... OK
#   Applying auth.0005_alter_user_last_login_null... OK
#   Applying auth.0006_require_contenttypes_0002... OK
#   Applying auth.0007_alter_validators_add_error_messages... OK
#   Applying auth.0008_alter_user_username_max_length... OK
#   Applying auth.0009_alter_user_last_name_max_length... OK
#   Applying auth.0010_alter_group_name_max_length... OK
#   Applying auth.0011_update_proxy_permissions... OK
#   Applying auth.0012_alter_user_first_name_max_length... OK
#   Applying sessions.0001_initial... OK


python manage.py createsuperuser
# ユーザー名 (leave blank to use 'adesu1'): manager
# メールアドレス:
# Password:aaapass
# Password (again):aaapass
# Superuser created successfully.


Django管理画面ログイン
manager/aaapass


# geojsonファイルからdjangoのmodels.pyで定義するテーブルクラス定義のソースコードをogrinspectコマンドを使って自動的に生成します。
# ogrinspectコマンドを使うとgeojsonファイルを解析してdjangoのmodels.pyで定義するモデルクラスのソースコードを自動的に生成してくれます。




# コマンドのオプションは以下の通りです。
# python manage.py ogrinspect --srid=<コード番号> <geojsonファイル名>
# <テーブルクラス名>

# 今回は空間参照系を識別するためのSRIDに4326を指定しています。
# cd C:\geodjango\tutorial
python .\manage.py ogrinspect --srid=4326 .\35_yamaguchi_HinanPoint.geojson Evacuation
## This is an auto-generated Django model module created by ogrinspect.
# from django.contrib.gis.db import models

# class Evacuation(models.Model):
#     指定緊急避難場所 = models.CharField(max_length=0)
#     所在地 = models.CharField(max_length=0)
#     洪水 = models.CharField(max_length=0)
#     がけ崩れ、土石流及び地滑り = models.CharField(max_length=0)
#     高潮 = models.CharField(max_length=0)
#     地震 = models.CharField(max_length=0)
#     津波 = models.CharField(max_length=0)
#     大規模な火事 = models.CharField(max_length=0)
#     内水氾濫 = models.CharField(max_length=0)
#     火山現象 = models.CharField(max_length=0)
#     geom = models.PointField(srid=4326)

# 出力されたDjangoModelを　model.py　に張り付ける。下記２点の注意を踏まえて修正しておく。
# ①カラム名はgeojsonファイル内の情報をそのまま利用するので日本語の部分はアルファベットに修正が必要。
# ②カラムのデータ長（max_length)はデフォルトですべて0として表示されるので適切なデータ長に修正が必要。


# model.py の定義ができたら
# EvacuationテーブルをPostgreSQLデータベースへ登録します。

python manage.py makemigrations
# Migrations for 'map':
#   map\migrations\0001_initial.py
#     - Create model Evacuation

python manage.py migrate
# Operations to perform:
#   Apply all migrations: admin, auth, contenttypes, map, sessions
# Running migrations:
#   Applying map.0001_initial... OK



# データ取り込みスクリプト　load_data.pyを作成したらDjango　shellで実行
cd C:\geodjango\tutorial

python manage.py shell
>>from map import load_data
>>load_data.run()          

# ～省略～
# Saved: 佐賀保育園
# Saved: 佐賀地域交流センター尾国分館及び運動広場
# Saved: 佐賀地域交流センター佐合分館及び広場
# Saved: 阿武町町民センター
# Saved: 阿武町体育センター
# Saved: 阿武小中学校屋内運動場
# Saved: 山口県立奈古高等学校屋内運動場
# Saved: 阿武町のうそんセンター
# Saved: 阿武町ふれあいセンター

# geojsonのデータがPostgreSQLデータベースに登録されます。admin　サイトで確認


# Mapのデザインを変更
pip　install　django-leaflet
# Collecting django-leaflet
#   Downloading django_leaflet-0.28.1-py3-none-any.whl (664 kB)
#      |████████████████████████████████| 664 kB 3.3 MB/s
# Requirement already satisfied: Django in c:\users\adesu1\onedrive\document\github\geodjangomapapp\venv\geodjango\lib\site-packages (from django-leaflet) (3.2.8)
# Collecting asgiref<4,>=3.3.2
#   Using cached asgiref-3.4.1-py3-none-any.whl (25 kB)
# Requirement already satisfied: sqlparse>=0.2.2 in c:\users\adesu1\onedrive\document\github\geodjangomapapp\venv\geodjango\lib\site-packages (from Django->django-leaflet) (0.3.1)
# Requirement already satisfied: pytz in c:\users\adesu1\onedrive\document\github\geodjangomapapp\venv\geodjango\lib\site-packages (from Django->django-leaflet) (2019.3)
# Installing collected packages: asgiref, django-leaflet
#   Attempting uninstall: asgiref
#     Found existing installation: asgiref 3.2.7
#     Uninstalling asgiref-3.2.7:
#       Successfully uninstalled asgiref-3.2.7
# Successfully installed asgiref-3.4.1 django-leaflet-0.28.1




# Djangoビューの設定

# ここでは、Evacuationテーブルに格納されている指定避難所データを全件取得してテンプレートファイル（index.html)にレンダリングする処理を実装します。

# C:\geodjango\tutorial\map\views.pyを開いて以下のコードを記載しましょう。


# <!-- pythonコードを記述する際には　{%　Python　%}　で記述する -->
        <!-- {% for object in object_list %}
        {{object.evacuation_site}}:{{object.geom}}<br>
        {% endfor %} -->


# GoogleAPIkey
# soft-div-gis@adesu.org
# AIzaSyDpQ06tsbCpUa9xtHqYaDdWwKI9MAz1r9c  2022/12/03時点

# adesukedonanika@gmail.com
# AIzaSyCr_fQbb8jqfmzR2ch5_wASokcH_G9pgPA　2022/12/03時点

#         <script
#             async defger src="https://googleapis.com/maps/api/js?key=AIzaSyC0kKR_GRmV0eCX-WD-zf47L_xtD6HPHlI>&callback=getPosition">
#         </script>



getPosition関数は以下のような処理を行うものとします。



①google.maps.Markerでマーカーを追加する。
②google.maps.InfoWindowで吹き出しを追加する。
③addListenerメソッドでマーカーにクリックイベントを追加する。
③infoWindow.openで吹き出しを表示する。



D:\OneDrive\Document\GitHub\geodjangomapapp\geodjango\tutorial>python manage.py ogrinspect --srid==4326 map\data\Forest_photoImages_20211010_JPG.geojson ForestSnapPhoto
# This is an auto-generated Django model module created by ogrinspect.
from django.contrib.gis.db import models


class ForestSnapPhoto(models.Model):
    image_filepath = models.CharField(max_length=0)
    image_datetime = models.DateTimeField()
    image_width = models.CharField(max_length=0)
    image_height = models.CharField(max_length=0)
    focallength = models.CharField(max_length=0)
    geom = models.PointField(srid==4326)


D:\OneDrive\Document\GitHub\geodjangomapapp\geodjango\tutorial>python manage.py makemigrations map
    Migrations for 'map':
  map\migrations\0001_initial.py
    - Create model Evacuation
    - Create model ForestSnapPhoto


https://github.com/Johnnyboycurtis/webproject/blob/master/web-config-template


VPSでデブロイ

Windowsの機能

IISをインストール
CGIをインストール

python環境に下記をインストール
wfastcgi


wwwroot/snapforestへWeb.configを配置

Python環境のパス`C:\Program Files\Python310`へ
`IIS AppPool\DefaultAppPool`＞名前の確認 してフルコントロールの権限を追加

Pythonのvenv仮想環境は使用しない。


管理者としてcmdを開く。
C:\>pip install wfastcgi
```
Collecting wfastcgi
  Using cached wfastcgi-3.0.0.tar.gz (14 kB)
  Preparing metadata (setup.py) ... done
Installing collected packages: wfastcgi
  DEPRECATION: wfastcgi is being installed using the legacy 'setup.py install' method, because it does not have a 'pyproject.toml' and the 'wheel' package is not installed. pip 23.1 will enforce this behaviour change. A possible replacement is to enable the '--use-pep517' option. Discussion can be found at https://github.com/pypa/pip/issues/8559
  Running setup.py install for wfastcgi ... done
Successfully installed wfastcgi-3.0.0
```

C:\>wfastcgi-enable
```
構成変更を構成コミット パス "MACHINE/WEBROOT/APPHOST" の "MACHINE/WEBROOT/APPHOST" のセクション "system.webServer/fastCgi" に適用しました
""C:\Program Files\Python310\python.exe"|"C:\Program Files\Python310\lib\site-packages\wfastcgi.py"" can now be used as a FastCGI script processor
```



IIS>サーバー名>構成エディタ>
 セクション>system.webServer/handlersを選択>セクションのロックを解除


IIS>サーバー名>Default Web Site>右クリック>仮想ディレクトリを追加
static
`C:\inetpub\wwwroot\snapforest\static`

Webアクセス許可
FireWall>詳細設定>受信の規則>80許可(world wide web)

500ServerError対策
Python環境のパス`C:\inetpub\wwwroot\snapforest`へ
`IIS AppPool\DefaultAppPool`＞名前の確認 してフルコントロールの権限を追加


