PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "api_keys" (`id` integer,`prefix` text UNIQUE,`hash` blob,`created_at` datetime,`expiration` datetime,`last_seen` datetime,PRIMARY KEY (`id`));
INSERT INTO api_keys VALUES(1,'hFKcRjLyfw',X'243261243130242e68554a6739332e6658333061326457723637464f2e6146424c74726e4542474c6c746437597a4253534d6f3677326d3944664d61','2023-04-09 22:34:28.624250346+00:00','2023-07-08 22:34:28.559681279+00:00',NULL);
INSERT INTO api_keys VALUES(2,'88Wbitubag',X'243261243130246f7932506d53375033334b733861376e7745434f3665674e776e517659374b5474326a30686958446c6c55696c3568513948307665','2024-07-28 21:59:38.786936789+00:00','2024-10-26 21:59:38.724189498+00:00',NULL);
CREATE TABLE `migrations` (`id` text,PRIMARY KEY (`id`));
INSERT INTO migrations VALUES('202312101416');
INSERT INTO migrations VALUES('202312101430');
INSERT INTO migrations VALUES('202402151347');
INSERT INTO migrations VALUES('2024041121742');
INSERT INTO migrations VALUES('202406021630');
INSERT INTO migrations VALUES('202409271400');
INSERT INTO migrations VALUES('202407191627');
INSERT INTO migrations VALUES('202408181235');
INSERT INTO migrations VALUES('202501221827');
INSERT INTO migrations VALUES('202501311657');
CREATE TABLE `policies` (`id` integer PRIMARY KEY AUTOINCREMENT,`created_at` datetime,`updated_at` datetime,`deleted_at` datetime,`data` text);
CREATE TABLE IF NOT EXISTS "pre_auth_keys"  (`id` integer,`key` text,`user_id` integer,`reusable` numeric,`ephemeral` numeric DEFAULT false,`used` numeric DEFAULT false,`created_at` datetime,`expiration` datetime,`tags` text,PRIMARY KEY (`id`),CONSTRAINT `fk_pre_auth_keys_user` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE SET NULL);
CREATE TABLE IF NOT EXISTS "nodes"  (`id` integer,`machine_key` text,`node_key` text,`disco_key` text,`hostname` text,`given_name` varchar(63),`user_id` integer,`register_method` text,`forced_tags` text,`auth_key_id` integer,`last_seen` datetime,`expiry` datetime,`host_info` text,`endpoints` text,`created_at` datetime,`updated_at` datetime,`deleted_at` datetime,`ipv4` text,`ipv6` text,PRIMARY KEY (`id`),CONSTRAINT `fk_nodes_user` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,CONSTRAINT `fk_nodes_auth_key` FOREIGN KEY (`auth_key_id`) REFERENCES `pre_auth_keys`(`id`));
INSERT INTO nodes VALUES(1,'mkey:a0ab77456320823945ae0331823e3c0d516fae9585bd42698dfa1ac3d7679e63','nodekey:7c84167ab68f494942de14deb83587fd841843de2bac105b6c670048c160554f','discokey:53075b3c6cad3b62a2a29caea61beeb93f66b8c75cb89dac465236a5bbf57759','hostname_1','given_name1',1,'cli','["tag:sshclient","tag:ssh"]',0,'2025-02-05 16:46:13.960213431+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-03-30 23:18:17.612740902+00:00','2025-02-05 16:46:13.960284003+00:00',NULL,'100.64.0.1','fd7a:115c:a1e0::1');
INSERT INTO nodes VALUES(2,'mkey:f63dda7495db68077080364ba4109f48dee7a59310b9ed4968beb40d038eb622','nodekey:8186817337049e092e6ea02507091d8e9686924d46ad0e74a90370ec0113c440','discokey:28a2df7e73b8196c6859c94329443a28f9605b2b83541b685c1db666bd835775','hostname_2','given_name2',1,'cli','["tag:sshclient"]',0,'2024-07-30 17:37:24.266006395+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-03-30 23:20:01.05202704+00:00','2024-07-30 17:37:24.266082813+00:00',NULL,'100.64.0.2','fd7a:115c:a1e0::2');
INSERT INTO nodes VALUES(3,'mkey:0af53661fedf5143af3ea79e596928302e51c9fc9f0ea9ed1f2bb7d54778b80e','nodekey:8defd8272fd2851601158b2444fc8d1ab12b6187ec5db154b7a83bb75b2ce952','discokey:ba9d1ffac1997acbd8d281b8711699daa77ed91691772683ebbfdaafa2518a52','hostname_3','given_name3',1,'cli','["tag:ssh"]',0,'2025-02-05 16:48:00.460606473+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-03-30 23:36:04.930844845+00:00','2025-02-05 16:48:00.460679869+00:00',NULL,'100.64.0.3','fd7a:115c:a1e0::3');
INSERT INTO nodes VALUES(4,'mkey:365e2055485de89e65e63c13e426b1ec5d5606327d63955b38be1d3f8cbbac6c','nodekey:996b9814e405f572fc0338f91b0c53f3a3a9a5b1ae0d2846d179195778d50909','discokey:ed72cb545b46b3e2ed0332f9cb4d7f4e774ea5834e2cbadc43c9bf7918ef2503','hostname_4','given_name4',1,'cli','["tag:ssh"]',0,'2025-02-05 16:48:00.460607206+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-03-31 15:51:56.149734121+00:00','2025-02-05 16:48:00.46092239+00:00',NULL,'100.64.0.4','fd7a:115c:a1e0::4');
INSERT INTO nodes VALUES(5,'mkey:1d04be488182a66cd7df4596ac59a40613eac6465a331af9ac6c91bb70754a25','nodekey:9b617f3e7941ac70b76f0e40c55543173e0432d4a9bb8bcb8b25d93b60a5da0e','discokey:15834557115cb889e8362e7f2cae1cfd7e78e754cb7310cff6b5c5b5d3027e35','hostname_5','given_name5',1,'cli','["tag:sshclient","tag:ssh"]',0,'2023-04-21 15:07:38.796218079+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-04-21 13:16:19.148836255+00:00','2024-04-17 15:39:21.339518261+00:00',NULL,'100.64.0.5','fd7a:115c:a1e0::5');
INSERT INTO nodes VALUES(6,'mkey:ed649503734e31eafad7f884ac8ee36ba0922c57cda8b6946cb439b1ed645676','nodekey:200484e66b43012eca81ec8850e4b5d1dd8fa538dfebdaac718f202cd2f1f955','discokey:600651ed2436ce5a49e71b3980f93070d888e6d65d608a64be29fdeed9f7bd6b','hostname_6','given_name6',1,'cli','["tag:ssh"]',0,'2023-07-09 16:56:18.876491583+00:00','0001-01-01 00:00:00+00:00','{}','[]','2023-05-07 10:30:54.520661376+00:00','2024-04-17 15:39:23.182648721+00:00',NULL,'100.64.0.6','fd7a:115c:a1e0::6');
CREATE TABLE IF NOT EXISTS "routes"  (`id` integer,`created_at` datetime,`updated_at` datetime,`deleted_at` datetime,`node_id` integer NOT NULL,`prefix` text,`advertised` numeric,`enabled` numeric,`is_primary` numeric,PRIMARY KEY (`id`),CONSTRAINT `fk_nodes_routes` FOREIGN KEY (`node_id`) REFERENCES `nodes`(`id`) ON DELETE CASCADE);
CREATE TABLE IF NOT EXISTS "users"  (`id` integer,`created_at` datetime,`updated_at` datetime,`deleted_at` datetime,`name` text UNIQUE,`display_name` text,`email` text,`provider_identifier` text,`provider` text,`profile_pic_url` text,PRIMARY KEY (`id`));
INSERT INTO users VALUES(1,'2023-03-30 23:08:54.151102578+00:00','2023-03-30 23:08:54.151102578+00:00',NULL,'username_1','display_name_1','email_1@example.com',NULL,NULL,NULL);
DELETE FROM sqlite_sequence;
CREATE UNIQUE INDEX `idx_api_keys_prefix` ON `api_keys`(`prefix`);
CREATE INDEX `idx_policies_deleted_at` ON `policies`(`deleted_at`);
CREATE INDEX `idx_routes_deleted_at` ON `routes`(`deleted_at`);
CREATE INDEX `idx_users_deleted_at` ON `users`(`deleted_at`);
COMMIT;
