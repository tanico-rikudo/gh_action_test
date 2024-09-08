-- DB切り替え
\c fastapi_db

-- テーブル作成
CREATE TABLE  fastapi_db.sample (
  col1 VARCHAR(10),
  col2 VARCHAR(10),
  col3 VARCHAR(10),
  PRIMARY KEY (col1)
);

-- 著者テーブルを作成
CREATE TABLE fastapi_db.Author (
    id SERIAL PRIMARY KEY,        -- 自動インクリメントのID
    name VARCHAR(255) NOT NULL,   -- 名前は必須
    books TEXT[]                  -- 書籍のリスト（リレーション用、補助的）
);

-- 書籍テーブルを作成
CREATE TABLE fastapi_db.Book (
    id SERIAL PRIMARY KEY,         -- 自動インクリメントのID
    name VARCHAR(255) NOT NULL,    -- 書籍名は必須
    author_id INTEGER NOT NULL,    -- 著者IDは必須
    author VARCHAR(255) NOT NULL,  -- 著者名（リレーション用、補助的）
    FOREIGN KEY (author_id) REFERENCES Author (id) -- 外部キー制約
);

-- 著者テーブルの書籍カラムを更新
-- このカラムは配列で書籍IDを持つことを想定しているが、通常はリレーションで管理する
-- 書籍テーブルに含まれる著者名とIDに基づく管理が一般的

-- 書籍テーブルに著者IDの制約を追加
ALTER TABLE Book
ADD CONSTRAINT fk_author
FOREIGN KEY (author_id) REFERENCES Author(id);


-- 権限追加
GRANT ALL PRIVILEGES ON testschema.Author TO fastapi_user;
GRANT ALL PRIVILEGES ON testschema.Book TO fastapi_user;

-- サンプルレコード作成
-- None