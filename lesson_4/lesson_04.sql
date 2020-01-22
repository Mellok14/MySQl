CREATE TABLE family_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE
);

SHOW TABLES;

INSERT INTO family_statuses (name) 
  VALUES 
  ('Single'),
  ('Married')
;

ALTER TABLE profiles ADD COLUMN family_status_id INT UNSIGNED AFTER hometown;  

DESC profiles

UPDATE profiles SET family_status_id = FLOOR(1 + (RAND() * 2));

UPDATE profiles SET updated_at = created_at WHERE updated_at < created_at;

UPDATE profiles SET birthdate = created_at WHERE birthdate > created_at;

SELECT * FROM profiles LIMIT 10

CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  autor_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  media_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT NOW()
);

SELECT * FROM posts LIMIT 10

INSERT INTO `posts` VALUES ('1','7','Voluptas tempora ipsa ut. Id assumenda qui voluptas porro. Dolorem quia consequatur et.','95','2005-06-27 18:33:17'),
('2','47','Ipsa quae accusantium non sint sed voluptatem. Autem vitae aspernatur modi. Deleniti ut qui quod quo qui consequatur. Incidunt ipsam porro ullam est et natus rerum.','45','1982-10-20 08:06:29'),
('3','19','Dolor et tenetur occaecati perferendis eos facere nobis quibusdam. Porro eos architecto error et voluptatibus nihil ipsum nesciunt. Commodi voluptatem deserunt ratione beatae molestias minus.','6','2017-08-07 18:06:36'),
('4','68','At praesentium consequatur deserunt ab maiores quidem voluptas soluta. Quia natus qui quod quia eligendi vel. Officiis sed eaque natus ut.','55','2007-05-05 01:26:42'),
('5','72','Est omnis natus non id. Libero recusandae eos quia ipsum animi consequuntur corrupti. Exercitationem molestiae temporibus dolores delectus ipsam enim. Quo dolores et architecto ullam nostrum. Reprehenderit quis ab ex.','4','1995-04-22 11:40:18'),
('6','34','Reprehenderit inventore iusto aperiam sit similique nesciunt voluptatem nam. Error repellat laborum rem laborum id sunt autem. Quod mollitia id placeat minus est doloremque blanditiis.','41','1981-07-17 16:03:07'),
('7','65','Et ullam accusamus non reiciendis optio. Culpa qui similique omnis neque reiciendis. Iusto qui pariatur ipsum sed eius exercitationem. Cupiditate aspernatur earum eligendi voluptates odit delectus in.','91','1998-10-31 05:26:40'),
('8','32','Non rerum ex aut delectus voluptatem. Qui qui dolores facilis eius est qui inventore. Officia consectetur itaque magnam eligendi modi. Nam quod qui sint architecto laudantium aliquam quos eius.','90','2010-04-12 05:38:10'),
('9','79','Placeat velit dolorem veniam voluptate exercitationem ab officia. Ut et architecto quia facere dolorum quod. Temporibus repudiandae rerum sunt temporibus rerum. Doloribus dolorem vitae nostrum quibusdam velit eius labore id.','17','1999-01-11 23:34:36'),
('10','42','Impedit assumenda aut dolor sunt voluptatem dolorum alias beatae. Et voluptatem voluptate veritatis suscipit rerum et qui recusandae.','43','2011-08-02 06:17:35'),
('11','62','Harum adipisci sunt libero. Repellat vitae placeat qui deserunt omnis est tempora dolorum. In adipisci aut ea qui. Ut consectetur nam laudantium est reiciendis.','41','2008-11-07 05:42:02'),
('12','73','Iure accusamus placeat similique. Distinctio molestiae consequatur consequatur autem quod perferendis consequatur. Sapiente ut harum assumenda libero. Ut placeat dolores provident esse.','17','1973-07-30 14:31:59'),
('13','1','Velit ipsa molestiae porro aut nemo. Et provident et aperiam accusamus impedit sed eum. Nostrum neque et quas velit illo.','33','1999-10-26 20:31:59'),
('14','1','Repudiandae placeat sed alias consequatur cum. Quae et quasi eaque non. Eos non itaque exercitationem et officiis et repellendus. Possimus quibusdam quas sit consequatur non aliquid quia.','18','2005-05-25 12:52:50'),
('15','30','Voluptatem aut corporis ipsam. Molestiae vel officia vel sunt consequatur magni. Sunt dolores omnis ipsam voluptatibus culpa. Sit veritatis et non illum et quas architecto.','77','1984-11-25 14:00:50'),
('16','19','Est quidem et libero dolorum incidunt. Praesentium eaque reprehenderit provident porro repudiandae. Ut maiores voluptates dolore delectus.','71','1992-03-29 17:06:20'),
('17','12','Necessitatibus cupiditate facilis consequatur nostrum sed. Quaerat impedit reiciendis omnis. Est minus est natus deleniti nesciunt. Molestiae ut temporibus sequi ut. Exercitationem odio ut doloremque et sed.','85','2012-11-28 05:34:01'),
('18','46','Debitis at quasi repellat. Voluptatum tenetur alias qui harum omnis ut quo. Sequi magni est qui fugit officia.','19','1990-12-08 18:18:18'),
('19','15','Recusandae aut quis dolores praesentium alias reiciendis quae. Voluptatem et voluptatem dignissimos dolorum quaerat. Sunt deserunt ex officiis maxime officiis sed accusamus.','92','2011-09-06 17:26:31'),
('20','44','Dolorem quidem rerum rerum sunt veritatis laudantium et. Occaecati autem consequatur maiores molestiae facilis expedita odit eum.','14','2019-10-24 21:59:27'),
('21','57','In repudiandae aperiam consequatur voluptates doloribus non repellat. Minima unde aut sunt quia optio fuga. Aut deserunt pariatur suscipit illum qui.','13','2005-10-24 01:56:23'),
('22','70','Facilis consectetur quibusdam doloribus et excepturi. Aspernatur expedita et provident. Sit placeat repellat aut odio saepe unde dolor mollitia. Ut inventore non veritatis aut iusto rerum. Non similique maxime ullam consequuntur labore.','14','1995-09-02 07:51:15'),
('23','15','Impedit hic distinctio voluptatem at consequuntur omnis dolor. Tenetur ad doloribus totam consequatur sed eos. Nihil saepe ipsam nihil sunt velit.','11','1992-06-12 15:08:49'),
('24','8','Saepe sunt cum omnis consequatur cupiditate et quo. Rerum provident enim optio nihil vitae. Vitae aut rem officia culpa consectetur repudiandae. Voluptas pariatur repudiandae et architecto veritatis.','97','1981-06-12 16:06:48'),
('25','40','Dolorem autem aut ex ut. Repudiandae aperiam at odio ut laboriosam distinctio dolor. Nam qui doloribus qui facere ut quia rerum. Eligendi eos ut officiis laudantium dolor.','26','2015-05-24 13:01:32'),
('26','37','Praesentium corporis recusandae ea est numquam voluptate minus. Quis non itaque ea repellendus ducimus. Consequatur eos cupiditate reprehenderit amet enim.','64','1981-08-25 09:15:08'),
('27','7','Quia dignissimos iure aut saepe id itaque sapiente. Dolor sapiente cum et eius est maxime. A ut vitae maiores cumque.','32','2002-05-17 22:09:39'),
('28','59','Excepturi est ea voluptates nihil. Rem et non praesentium natus et asperiores. Earum assumenda omnis et. Ullam vero eos quam asperiores occaecati consequatur. Maiores optio nihil quo pariatur culpa amet.','84','1992-12-07 00:25:11'),
('29','10','Hic dignissimos voluptatem sed sit blanditiis enim. Fugit cupiditate architecto illo ex dolore ea ad perferendis. Ea et voluptas voluptatibus quos delectus aut.','1','2005-12-01 15:46:17'),
('30','78','Velit sequi qui accusantium sed harum aliquam hic. Aliquam dolores quos commodi recusandae tempore. Ipsam in eius vero unde nesciunt. Voluptas ipsum necessitatibus praesentium nihil perspiciatis.','40','2001-01-11 13:53:15'),
('31','69','Non non aut vitae distinctio excepturi placeat quia corrupti. Eos asperiores sit et perferendis. Vero labore quasi doloremque ut.','28','1979-11-14 01:54:23'),
('32','28','Modi in perferendis totam ad quis. Inventore maiores aut nisi dolor quidem eaque natus. Quibusdam soluta quisquam laudantium repellat qui consequatur et qui. Sequi magnam voluptatem nam tempora.','2','1997-04-19 11:57:59'),
('33','40','Hic et qui delectus nostrum sapiente. Non veniam vitae fugit magnam in. Ea quia vel veniam ipsa repudiandae ratione. Voluptatem neque dolore cumque.','79','1979-10-01 09:47:49'),
('34','89','Veniam incidunt et at suscipit. Autem voluptas repellendus natus animi. Amet voluptatum consequatur beatae ut ut distinctio consequatur. Laudantium temporibus facilis dolor ipsam et alias placeat.','36','1994-01-06 13:08:38'),
('35','70','Quia nobis ipsa natus. Sit laborum dolor corrupti ea tempora. Minus distinctio natus culpa beatae voluptatem et. Odio in quod voluptatibus tempora perspiciatis accusantium ut aut. Fugiat perspiciatis mollitia quia quasi modi maxime tenetur dolorem.','56','1997-08-13 21:23:32'),
('36','35','Ex laborum quos nam nesciunt debitis autem. Veritatis enim assumenda aliquam ut sed dignissimos. Dolor quis amet blanditiis mollitia culpa tempore at atque. Nihil velit cum quaerat omnis.','57','2008-08-27 11:11:26'),
('37','25','In placeat laudantium ipsam rem alias. Minima sunt et illum sapiente. Ullam incidunt maiores aliquam quia itaque facere quo et. Et et vel rerum adipisci saepe quaerat.','28','1993-09-02 19:22:11'),
('38','95','Fugit explicabo laborum qui. Qui rerum at laborum corporis quia. Id sint ipsam et dolores sit ipsam.','35','1982-03-03 18:05:53'),
('39','71','Sit tenetur adipisci placeat accusantium recusandae est. Soluta veritatis voluptatibus corporis hic expedita. Odit in nostrum doloremque quisquam odio maiores aut. Accusamus nobis ducimus aut laboriosam unde saepe dolor.','71','2011-12-14 17:28:17'),
('40','89','Beatae illo ea ut voluptas dolores. Quidem fugiat recusandae quo.','44','2019-12-17 00:44:04'),
('41','7','Necessitatibus odio et omnis excepturi ipsum voluptate quo. Sint sed ducimus temporibus molestiae sapiente. Molestiae ut nemo provident. Quo beatae nihil eveniet qui qui sed quidem.','67','2003-09-01 22:40:52'),
('42','91','Et repellat ut vel libero. Omnis reiciendis minima vitae possimus. Aut sunt numquam est odio earum vitae. Dicta eligendi voluptatem incidunt.','40','2003-03-23 16:32:36'),
('43','41','Omnis numquam beatae vitae saepe rem. Quibusdam aspernatur illo beatae consequatur. Odio qui qui aperiam cum facilis. Incidunt odit est necessitatibus.','93','1992-02-14 10:31:38'),
('44','20','Sunt voluptatem dolores quibusdam beatae. Ut voluptate sequi voluptatem autem voluptatibus modi. Repudiandae autem dolores nihil ut adipisci.','17','1977-01-24 09:34:32'),
('45','71','Culpa explicabo recusandae aliquam neque ut cumque distinctio sint. Officiis nostrum inventore et nemo. Deleniti praesentium cupiditate quis voluptatum laboriosam at. Ut quod sit nulla assumenda beatae dolorem.','77','1999-10-30 05:09:11'),
('46','51','Quidem praesentium eum velit est nihil. Hic commodi ratione ipsa animi nihil et. Consequatur dolorem qui est sed quia saepe.','99','1987-07-06 10:59:24'),
('47','61','Nemo facere accusantium aut dolorum optio non. Eos autem consequatur rerum exercitationem. Est facilis repellendus et vitae et tenetur aut sapiente.','73','1991-04-28 05:13:28'),
('48','97','Consequuntur aliquam qui rerum asperiores aut. Assumenda cupiditate dolores accusamus velit ut omnis et quis. A qui quae eos dolore. Necessitatibus eius inventore quam nesciunt molestiae.','11','2012-07-08 18:25:53'),
('49','5','Minima reprehenderit doloribus rerum odit repellat. Laborum mollitia molestiae animi est dolor quia. Dicta omnis enim consectetur tempora maxime officia asperiores.','24','1984-05-31 03:13:02'),
('50','20','Nihil esse ea iste nulla magni sint. Et suscipit neque necessitatibus tenetur consequatur et facere. Aspernatur et est soluta deleniti.','8','1993-09-21 01:19:52'),
('51','85','Ut sunt sit ut cupiditate inventore neque. Rerum ad nemo quae. Ut cumque modi sapiente et sint. Sunt ducimus necessitatibus quia eveniet.','26','1996-04-24 22:54:53'),
('52','98','Voluptatibus est accusantium illo nihil sequi. Quia temporibus placeat culpa quod iusto esse mollitia nobis. Consequuntur quo odio ut accusantium dicta facilis. Ea hic et voluptas quis praesentium sapiente nulla.','79','1985-10-11 02:40:24'),
('53','80','Numquam non ut omnis tempora amet ullam. Iste aliquid dolorem numquam est et illo maxime. Est cumque facilis minus sed omnis ducimus.','21','2003-08-13 10:42:14'),
('54','23','Ullam inventore accusamus rerum asperiores minus magni aperiam. Quo et fuga maiores inventore molestiae. Molestiae voluptatem amet quis.','99','2012-03-08 08:11:08'),
('55','4','Maxime eum aliquam quo molestiae molestiae debitis. Quia ex occaecati labore sunt quae.','37','2004-07-09 04:18:38'),
('56','84','Commodi ut facere autem quidem quia atque. Animi reiciendis est laudantium hic provident qui animi dolorem. Est omnis eos ut aut voluptatibus voluptas tenetur.','47','2013-10-21 08:30:26'),
('57','38','Molestiae perspiciatis suscipit nam distinctio aut est. Corporis quia natus doloremque. Id non at nostrum et aut sed. Ab laudantium nihil molestiae minima labore neque.','28','1972-09-26 12:14:31'),
('58','84','Vero corporis nobis eligendi necessitatibus exercitationem enim qui. Magni deleniti ea at fugiat tempora saepe assumenda. Quasi corporis harum rerum consectetur cumque.','16','1970-08-30 21:40:48'),
('59','76','Aut nisi corporis iure et quia sed vero necessitatibus. Nihil deserunt deleniti enim quia necessitatibus id consequatur ratione. A commodi dolorem harum amet voluptatem fuga mollitia. Nostrum nemo beatae et odit.','7','1991-01-29 03:07:46'),
('60','60','Dolorum non voluptates dolorem ex et. Quia totam sed unde sit. Explicabo cupiditate veniam porro recusandae laborum praesentium magnam aliquid. Est ea ratione qui ut in non.','71','1985-09-24 09:28:15'),
('61','15','Aliquam a neque doloremque aut sed eaque. Adipisci debitis consequatur beatae possimus. Et sit praesentium tenetur facere. Iusto perferendis officiis eaque. Nihil assumenda non vel officia sint nesciunt saepe.','27','1977-03-04 05:21:50'),
('62','36','Natus adipisci rem aliquid eum. Distinctio est officiis doloremque ex officia molestiae repellat.','17','2006-11-08 00:57:11'),
('63','96','Nesciunt commodi sit at. Aspernatur voluptas quis cumque ea et ut rerum omnis.','95','1983-12-06 17:36:31'),
('64','58','Temporibus animi ut sint rerum sed expedita officia. Quae ipsam dolorem quisquam nisi perspiciatis qui. Commodi aliquid ab labore dolor accusantium a distinctio in. Laborum sunt nihil molestiae iusto quis velit quia.','75','2008-10-12 02:57:26'),
('65','30','Nobis dolore eos itaque. Voluptates quae natus alias facere. Ex quia quisquam doloribus ut repellat.','92','1978-09-24 01:33:19'),
('66','65','Exercitationem nobis totam ipsum quae. Ea fuga sit rem iste qui enim. Nihil explicabo quod quibusdam dolorum sapiente laboriosam dolorem.','65','2016-11-21 17:41:06'),
('67','13','In exercitationem placeat voluptas fuga quasi aut. Minima qui quia laborum at consequatur maxime nobis. Enim soluta magni deserunt asperiores cum. Est eos molestias ea quas dolor voluptas dignissimos.','8','1986-10-15 21:19:50'),
('68','68','Incidunt ea enim ipsa molestiae. Laudantium similique facere omnis. Aperiam ut sunt sunt non minima repellat. Facere facere dolores aliquam nesciunt non aut.','53','1997-05-01 17:52:47'),
('69','21','Repellat sapiente et et occaecati minima illo sunt. Optio sequi eos qui nobis architecto distinctio. Delectus adipisci ut veniam voluptatem. Consectetur sed sed nulla nemo ea maiores nulla neque. Atque cupiditate consequatur tenetur neque.','22','1975-03-20 13:22:47'),
('70','51','Inventore alias magnam dicta voluptatem. Nisi consequuntur ut nobis iste.','26','1992-01-07 22:19:56'),
('71','8','Sint a voluptas provident aut odit. Quo adipisci est aut necessitatibus ut et. Earum ea aspernatur suscipit voluptas.','1','1996-08-10 19:19:41'),
('72','55','Consequatur dolorem quia aliquid veritatis nulla autem repellendus. Voluptatum totam rerum illo quia. Voluptatibus molestias nihil deserunt amet possimus exercitationem numquam consequatur. Numquam eos voluptas adipisci unde consequatur dolor minima. Placeat magnam architecto magnam reiciendis aut quaerat.','74','1999-06-13 01:46:50'),
('73','69','Modi sapiente fugiat minus dolorem ut aspernatur. Fugit iste ut ut illo. Quia qui nihil aperiam autem laboriosam.','97','1993-12-24 00:43:56'),
('74','48','Dignissimos iure quam quos illo aut hic. Enim quia dolores ipsa saepe eos doloribus. Quia aut doloribus enim maxime minima. Ipsa qui corrupti enim necessitatibus ut corrupti quis architecto.','16','2014-12-01 20:10:44'),
('75','53','Error voluptate architecto inventore ipsum sapiente. Rem ut inventore quidem consequatur vel et sit. Quia enim sint sint ducimus et. Sequi quaerat temporibus voluptatibus ut dolorem.','85','2009-07-26 04:18:25'),
('76','62','Iure laboriosam culpa et laudantium id repellendus eveniet. Rem iure pariatur perspiciatis voluptas. Id minus in distinctio illum maiores. Est dolores corrupti fugiat cupiditate molestias voluptate.','72','2006-01-27 02:00:53'),
('77','38','Aperiam nemo quisquam dolor molestias eum porro. Voluptate minima assumenda sit quibusdam esse neque tempora ea. Commodi excepturi unde ad voluptas. Architecto ipsam ducimus rerum eius sapiente.','84','2011-12-05 11:08:22'),
('78','81','Rerum quia mollitia officia consequatur inventore. Enim reiciendis omnis doloribus vel. Ut eligendi magnam ratione et tenetur corporis deleniti temporibus. Quidem quas assumenda aperiam sed quo voluptatibus rerum dolorem.','68','1997-09-18 23:33:50'),
('79','40','Accusantium velit eos assumenda aperiam sit architecto. Nostrum officiis nam doloremque et doloremque quisquam.','49','1975-10-12 21:12:45'),
('80','67','Sint incidunt asperiores nostrum. Reprehenderit adipisci doloremque repellendus voluptates aut ut quae. Quae ut ducimus nemo accusantium veritatis veritatis.','77','2011-10-16 08:26:55'),
('81','22','Alias hic non et pariatur. Quibusdam necessitatibus illum sunt voluptatem. Commodi et et et voluptas et ut.','19','1979-05-02 19:46:36'),
('82','91','Nobis et quam dolorum quis sint enim. Quia accusantium totam quas laborum est. Quis vel quod asperiores ut incidunt unde. Soluta aspernatur illum dolorem nesciunt eligendi autem aut. Autem consequatur molestias rem quae aliquam.','86','1985-05-16 22:07:04'),
('83','98','Doloribus velit laudantium beatae natus dolor nihil. Unde ab est et asperiores eveniet aut. Ab nostrum enim sunt.','76','1974-10-12 02:00:45'),
('84','82','Amet rerum fugiat neque molestias totam deserunt harum fugit. Non voluptates autem quo laborum. Adipisci est nisi reiciendis harum. Unde qui tenetur minus nulla quibusdam molestias tempore.','7','2006-06-10 07:14:22'),
('85','66','Commodi aut quasi sit sed eaque quia. Rem vitae repudiandae quaerat natus reiciendis. Ratione quaerat laborum assumenda tempore voluptatem.','92','1992-02-15 16:07:31'),
('86','99','Impedit vero quam ducimus autem expedita. Ut odit in vel voluptate sint voluptate. Cupiditate explicabo perspiciatis voluptatum et et quidem.','37','1998-03-13 07:42:59'),
('87','35','Suscipit quia assumenda quod perferendis corporis. Sunt voluptas fugiat quia ipsam et eligendi non natus. Minus nam aspernatur ut quia saepe. Magni et voluptatem beatae ut occaecati rerum est.','51','2012-04-19 03:42:43'),
('88','86','Quo consectetur vel aut animi dolore neque. Sunt ut consequatur delectus labore. Eveniet at aliquid unde voluptatem.','55','1979-06-05 16:42:34'),
('89','36','Molestiae laboriosam quia est voluptatibus ea et ea quo. Assumenda omnis error tempora quam eum et. Beatae reiciendis commodi et fuga accusantium. Quo dolore tempore dolor id autem.','65','1978-02-04 22:16:08'),
('90','22','Rem atque deleniti aperiam magnam dignissimos dolorum voluptatibus. Qui nihil unde quos expedita repellat corrupti non perspiciatis. Et atque ullam nulla voluptatem. Odit dolores explicabo minus excepturi accusamus ea ut quis.','96','2010-11-22 03:14:46'),
('91','68','Ducimus occaecati id dolorem deserunt et consequatur. Eveniet vitae dolorem voluptatem consectetur quas ullam. Id qui aliquam dolore adipisci earum consequatur. Totam dolorem ut inventore rerum eum.','27','1981-05-13 11:24:55'),
('92','64','Ipsam recusandae et debitis cum. Voluptatibus excepturi omnis quam officiis error in molestias sint. Quam dolor nemo officia aliquid reiciendis veritatis. Doloremque fuga recusandae qui quasi error et.','31','2010-03-17 06:11:30'),
('93','87','Ratione ea maiores et eos. Consequatur reprehenderit repudiandae quod eaque. Non eum id sit sint. Velit repellat facilis a optio eos omnis et.','100','2011-04-30 01:49:49'),
('94','67','Magni expedita voluptatem aut non est sint cumque. Debitis omnis sit et nam sed exercitationem nisi quidem. Error placeat totam deserunt deleniti nobis eaque aspernatur dolores.','2','1995-11-30 10:25:14'),
('95','90','Iste dolorem magnam aut hic voluptas. Voluptatem quia pariatur sint aut. Provident et ratione veritatis.','69','2014-06-11 11:23:42'),
('96','63','Nobis qui aliquam et ullam debitis inventore vero est. Consequatur eum eaque iure reiciendis. Earum magni voluptatem debitis aliquam rerum accusantium distinctio. Alias commodi quia at est rerum corrupti sed.','21','1978-11-02 09:48:31'),
('97','13','Sed odio rerum atque excepturi placeat error. Qui quo cupiditate est qui porro unde. Et aut aperiam ut pariatur non et quam est.','83','1975-01-07 21:15:13'),
('98','18','Aliquid delectus ad consequuntur pariatur. Delectus dignissimos quam perferendis esse et fugit ipsa. Animi fuga laboriosam et sint cupiditate illum optio. Nulla vitae occaecati sed enim ut minus.','19','2004-04-27 12:11:58'),
('99','14','Ad magnam eos maxime iusto perferendis qui dicta. Et voluptatem temporibus nihil ut fugiat. Cupiditate id minima asperiores nostrum.','13','1984-11-29 23:04:25'),
('100','81','Dignissimos error culpa repellendus aliquam quidem sunt. Cumque dignissimos quis sed. Mollitia repudiandae quasi quia quia ullam voluptatem quam.','13','1979-09-04 20:58:21'); 

UPDATE users SET updated_at = created_at WHERE updated_at < created_at;

SELECT * FROM messages LIMIT 10;

UPDATE messages SET
  from_user_id = FLOOR(1 + (RAND() * 100)),
  to_user_id = FLOOR(1 + (RAND() * 100))
;

UPDATE messages SET to_user_id = to_user_id + 1 WHERE from_user_id = to_user_id;

SELECT * FROM media LIMIT 10;

SELECT * FROM media_types LIMIT 10;

UPDATE media_types SET name = 'audio' WHERE name = ' track';

UPDATE media SET user_id = FLOOR(1 + (RAND() * 100));

UPDATE media SET filename = CONCAT('https://dropbox/vk/file_', metadata);

UPDATE media SET metadata = CONCAT(
  '{"', 
  'owner', 
  '":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
   '"}');
  
 DESC media;
 
 ALTER TABLE media MODIFY COLUMN metadata JSON;

UPDATE media SET updated_at = created_at WHERE updated_at < created_at;

SELECT * FROM friendship LIMIT 10;

UPDATE friendship SET
  user_id = FLOOR(1 + (RAND() * 100)),
  friend_id = FLOOR(1 + (RAND() * 100))
;

DESC friendship;

SELECT * FROM friendship_statuses;

TRUNCATE friendship_statuses;

INSERT INTO friendship_statuses (name)
  VALUES ('Requested'), ('Confirmed'), ('Rejected');
 
UPDATE friendship SET status_id = FLOOR(1 + (RAND() * 3));

UPDATE friendship SET requested_at = confirmed_at WHERE requested_at > confirmed_at;

SELECT * FROM communities LIMIT 10;

DELETE FROM communities WHERE id > 10;

SELECT * FROM communities_users LIMIT 10;

UPDATE communities_users SET
  community_id = FLOOR(1 + (RAND() * 10))
;
