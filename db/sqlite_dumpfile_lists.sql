PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "lists" ("id" integer NOT NULL PRIMARY KEY, "order_id" integer DEFAULT NULL, "item_id" integer DEFAULT NULL, "amount" integer DEFAULT NULL, "list_price" integer DEFAULT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "discount" integer DEFAULT 0);
INSERT INTO lists VALUES(1,1,1,6,20,'2020-08-04 18:34:52.508160','2020-08-04 18:47:30.114855',0);
INSERT INTO lists VALUES(2,1,2,6,4,'2020-08-04 18:49:58.085255','2020-08-04 18:49:58.085255',0);
INSERT INTO lists VALUES(3,2,1,1,20,'2020-08-05 03:24:08.776565','2020-08-05 03:25:10.992466',0);
INSERT INTO lists VALUES(4,3,1,1,20,'2020-08-05 04:24:32.990187','2020-08-05 04:25:59.251050',0);
INSERT INTO lists VALUES(5,4,1,1,20,'2020-08-05 04:26:15.650145','2020-08-05 04:26:15.650145',0);
INSERT INTO lists VALUES(6,5,1,1,20,'2020-08-05 04:26:26.475042','2020-08-05 04:27:03.573480',0);
INSERT INTO lists VALUES(7,6,1,1,20,'2020-08-05 04:27:46.030622','2020-08-05 04:27:46.030622',20);
INSERT INTO lists VALUES(8,7,1,1,20,'2020-08-05 04:28:11.936473','2020-08-05 04:28:11.936473',20);
INSERT INTO lists VALUES(9,8,1,1,20,'2020-08-05 04:28:27.867857','2020-08-05 04:28:27.867857',5);
INSERT INTO lists VALUES(10,9,1,1,20,'2020-08-05 04:28:40.116593','2020-08-05 04:28:40.116593',5);
INSERT INTO lists VALUES(11,10,1,2,20,'2020-08-05 04:29:05.053256','2020-08-05 04:29:05.053256',15);
COMMIT;
