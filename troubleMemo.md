

```
Traceback (most recent call last):
  File "C:\geodjango\geodjangomapapp\geodjango\snapforest\manage.py", line 22, in <module>
    main()
  File "C:\geodjango\geodjangomapapp\geodjango\snapforest\manage.py", line 18, in main
    execute_from_command_line(sys.argv)
  File "C:\geodjango\geodjango\lib\site-packages\django\core\management\__init__.py", line 419, in execute_from_command_line
    utility.execute()
  File "C:\geodjango\geodjango\lib\site-packages\django\core\management\__init__.py", line 395, in execute
    django.setup()
  File "C:\geodjango\geodjango\lib\site-packages\django\__init__.py", line 24, in setup
    apps.populate(settings.INSTALLED_APPS)
  File "C:\geodjango\geodjango\lib\site-packages\django\apps\registry.py", line 114, in populate
    app_config.import_models()
  File "C:\geodjango\geodjango\lib\site-packages\django\apps\config.py", line 301, in import_models
    self.models_module = import_module(models_module_name)
  File "C:\Program Files\Python310\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\auth\models.py", line 3, in <module>
    from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\auth\base_user.py", line 48, in <module>
    class AbstractBaseUser(models.Model):
  File "C:\geodjango\geodjango\lib\site-packages\django\db\models\base.py", line 122, in __new__
    new_class.add_to_class('_meta', Options(meta, app_label))
  File "C:\geodjango\geodjango\lib\site-packages\django\db\models\base.py", line 326, in add_to_class
    value.contribute_to_class(cls, name)
  File "C:\geodjango\geodjango\lib\site-packages\django\db\models\options.py", line 207, in contribute_to_class
    self.db_table = truncate_name(self.db_table, connection.ops.max_name_length())
  File "C:\geodjango\geodjango\lib\site-packages\django\utils\connection.py", line 15, in __getattr__
    return getattr(self._connections[self._alias], item)
  File "C:\geodjango\geodjango\lib\site-packages\django\utils\connection.py", line 62, in __getitem__
    conn = self.create_connection(alias)
  File "C:\geodjango\geodjango\lib\site-packages\django\db\utils.py", line 204, in create_connection
    backend = load_backend(db['ENGINE'])
  File "C:\geodjango\geodjango\lib\site-packages\django\db\utils.py", line 111, in load_backend
    return import_module('%s.base' % backend_name)
  File "C:\Program Files\Python310\lib\importlib\__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\backends\postgis\base.py", line 6, in <module>
    from .features import DatabaseFeatures
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\backends\postgis\features.py", line 1, in <module>
    from django.contrib.gis.db.backends.base.features import BaseSpatialFeatures
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\backends\base\features.py", line 3, in <module>
    from django.contrib.gis.db import models
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\models\__init__.py", line 3, in <module>
    import django.contrib.gis.db.models.functions  # NOQA
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\models\functions.py", line 3, in <module>
    from django.contrib.gis.db.models.fields import BaseSpatialField, GeometryField
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\db\models\fields.py", line 3, in <module>
    from django.contrib.gis import forms, gdal
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\forms\__init__.py", line 3, in <module>
    from .fields import (  # NOQA
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\forms\fields.py", line 2, in <module>
    from django.contrib.gis.gdal import GDALException
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\gdal\__init__.py", line 28, in <module>
    from django.contrib.gis.gdal.datasource import DataSource
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\gdal\datasource.py", line 40, in <module>
    from django.contrib.gis.gdal.driver import Driver
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\gdal\driver.py", line 5, in <module>
    from django.contrib.gis.gdal.prototypes import ds as vcapi, raster as rcapi
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\gdal\prototypes\ds.py", line 9, in <module>
    from django.contrib.gis.gdal.libgdal import GDAL_VERSION, lgdal
  File "C:\geodjango\geodjango\lib\site-packages\django\contrib\gis\gdal\libgdal.py", line 53, in <module>
    lgdal = CDLL(lib_path)
  File "C:\Program Files\Python310\lib\ctypes\__init__.py", line 374, in __init__
    self._handle = _dlopen(self._name, mode)
FileNotFoundError: Could not find module 'C:\OSGeo4W\bin\gdal302.dll' (or one of its dependencies). Try using the full path with constructor syntax.

```



libgdal.pyを編集して解決
```
if lib_path:
    lib_names = None
elif os.name == 'nt':
    # Windows NT shared libraries
    lib_names = [
        'gdal306', 'gdal302', 'gdal301', 'gdal300',
        'gdal204', 'gdal203', 'gdal202', 'gdal201', 'gdal20',
    ]
```

