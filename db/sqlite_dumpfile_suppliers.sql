PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "suppliers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "representative" varchar, "email" varchar, "address" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO suppliers VALUES(1,'ヤマテック・クライミング','山田航','contact@yamatech-climbing.com','大阪府高槻市浦堂3-1-9','2020-08-05 06:26:27.720006','2020-08-05 17:30:42.139119');
INSERT INTO suppliers VALUES(2,'Hostinger','Hostinger Team','en@hostinger.com','','2020-08-05 19:01:22.942475','2020-08-05 19:01:22.942475');
INSERT INTO suppliers VALUES(3,'Akismet','Automattic','support@akismet.com','','2020-08-05 20:17:44.693354','2020-08-05 20:17:44.693354');
INSERT INTO suppliers VALUES(4,'Glophics(StickerCanada)','','info@stickercanada.com','2 Robert Speck Parkway Suite 750, Mississauga, Ontario, L4Z 1H8','2020-08-05 20:36:02.216944','2020-08-05 20:36:02.216944');
INSERT INTO suppliers VALUES(5,'Canva','','notifications@canva.com','','2020-08-05 20:45:01.975007','2020-08-05 20:45:01.975007');
COMMIT;
