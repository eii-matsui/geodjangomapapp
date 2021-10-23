
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
