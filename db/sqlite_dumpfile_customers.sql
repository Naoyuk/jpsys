PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "customers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "address" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO customers VALUES(1,'Climb On','accounting@climbonsquamish.com','37873 Cleveland Ave, Squamish, BC V8B 0S8','2020-08-04 09:19:13.840151','2020-08-04 09:19:13.840151');
INSERT INTO customers VALUES(2,'Keita Azumaguchi','','','2020-08-04 09:20:06.131534','2020-08-04 09:20:06.131534');
INSERT INTO customers VALUES(3,'Ryutaro Shuto','','','2020-08-04 09:20:11.081563','2020-08-04 09:20:11.081563');
INSERT INTO customers VALUES(4,'Daisuke Yamaki','d.yamaki.gdb@gmail.com','','2020-08-04 09:20:16.760025','2020-08-04 09:22:52.378510');
INSERT INTO customers VALUES(5,'Sejin Lee','','','2020-08-04 09:20:22.008360','2020-08-04 09:20:22.008360');
INSERT INTO customers VALUES(6,'Ryan','','','2020-08-04 09:20:27.214010','2020-08-04 09:20:27.214010');
INSERT INTO customers VALUES(7,'Gneiss Climbing Gym','chris@gneissclimbing.com','430 Banks Rd #101, Kelowna, BC V1X 6A3','2020-08-04 09:21:21.900777','2020-08-04 09:21:21.900777');
INSERT INTO customers VALUES(8,'Stephen Salvador','cp0539jndcwuhragc3xhsawx3mvtj5ap3mn8pj6d6ojwa@3m.rbc.com','','2020-08-04 09:21:40.478207','2020-08-04 09:25:05.039269');
INSERT INTO customers VALUES(9,'Jireh Climaco','jirehcclimaco@gmail.com','','2020-08-04 09:21:48.409483','2020-08-05 17:29:36.867539');
INSERT INTO customers VALUES(10,'Seiji Ohuchi','sohuchi1@gmail.com','','2020-08-04 09:21:53.646785','2020-08-04 09:24:53.117863');
COMMIT;
