-- DB作成
CREATE DATABASE fastapi_db; 

-- 作成したDBへ切り替え
\c fastapi_db

-- スキーマ作成
CREATE SCHEMA testschema;

-- ロールの作成
CREATE ROLE fastapi_user WITH LOGIN PASSWORD 'password';

-- 権限追加
GRANT ALL PRIVILEGES ON SCHEMA testschema TO fastapi_user;