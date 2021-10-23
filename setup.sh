
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
# Password:
# Password (again):
# Superuser created successfully.
