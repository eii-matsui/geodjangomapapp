cd C:\geodjango\geodjangomapapp


@REM call ..\geodjango\Scripts\activate.bat

@REM start %windir%\explorer.exe "C:\geodjango\geodjangomapapp"

cd C:\inetpub\wwwroot\snapforest


python manage.py runserver 8244

pause > nul
