psql -U postgres -l
# password  kuLcSkn2



createdb -U postgres -E UTF-8 geodjangodb


psql -U postgres -d postgres

C:\Users\adesu1>psql -U postgres -d postgres
-- ユーザ postgres のパスワード:
-- psql (11.13)
-- "help" でヘルプを表示します。

postgres=# \l
                                              データベース一覧
--     名前     |  所有者  | エンコーディング |      照合順序      | Ctype(変換演算子)  |     アクセス権限
-- -------------+----------+------------------+--------------------+--------------------+-----------------------
--  geodjangodb | postgres | UTF8             | Japanese_Japan.932 | Japanese_Japan.932 |
--  postgres    | postgres | UTF8             | Japanese_Japan.932 | Japanese_Japan.932 |
--  template0   | postgres | UTF8             | Japanese_Japan.932 | Japanese_Japan.932 | =c/postgres          +
--              |          |                  |                    |                    | postgres=CTc/postgres
--  template1   | postgres | UTF8             | Japanese_Japan.932 | Japanese_Japan.932 | =c/postgres          +
--              |          |                  |                    |                    | postgres=CTc/postgres


-- 接続解除
\q

psql -U postgres -d geodjangodb -c "CREATE EXTENSION postgis;"
-- ユーザ postgres のパスワード:
-- CREATE EXTENSION


psql -U postgres -d geodjangodb
-- ユーザ postgres のパスワード:
-- psql (11.7)
-- "help" でヘルプを表示します。

-- geodjangodb=#    


select * from pg_available_extensions;