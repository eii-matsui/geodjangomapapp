
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
