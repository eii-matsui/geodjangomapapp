

select * from pg_available_extensions;

CREATE USER django_admin WITH PASSWORD 'django_admin';
-- CREATE ROLE

-- django_adminに全権限を付与
GRANT ALL PRIVILEGES ON DATABASE geodjangodb TO django_admin;
-- GRANT