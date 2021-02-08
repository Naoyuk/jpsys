PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "items" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "price" integer, "stock" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO items VALUES(1,'fluffy20(L)',20,1,'2020-08-03 03:34:37.399588','2020-08-04 09:03:24.937965');
INSERT INTO items VALUES(2,'fluffy20(S)',6,0,'2020-08-04 09:03:38.691349','2020-08-04 09:03:38.691349');
COMMIT;
