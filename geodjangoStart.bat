cd C:\geodjango\geodjangomapapp


call ..\geodjango\Scripts\activate.bat

start %windir%\explorer.exe "C:\geodjango\geodjangomapapp"

cd C:\geodjango\geodjangomapapp\geodjango\snapforest


python manage.py runserver 8244

pause > nul
