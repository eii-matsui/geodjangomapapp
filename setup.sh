
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
# No changes detected