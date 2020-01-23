DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255),
  birthday_at DATE,
  created_at DATETIME, 
  updated_at DATETIME
);

DESC users

INSERT INTO users (id, name, birthday_at) VALUES
  (1,'Геннадий', '1990-10-05'),
  (2,'Наталья', '1984-11-12'),
  (3,'Александр', '1985-05-20'),
  (4,'Сергей', '1988-02-14'),
  (5,'Иван', '1998-01-12'),
  (6,'Мария', '1992-08-29');
  
SELECT * FROM users
 
UPDATE users SET created_at = NOW(), updated_at = NOW();

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255),
  birthday_at DATE,
  created_at VARCHAR(255), 
  updated_at VARCHAR(255)
);

ALTER TABLE users MODIFY COLUMN created_at DATETIME;

ALTER TABLE users MODIFY COLUMN updated_at DATETIME;

CREATE TABLE storehouses_products (
  id INT UNSIGNED NOT NULL,
  value INT UNSIGNED NOT NULL
);
 
INSERT INTO storehouses_products (id, value) VALUES
  (1,0),
  (2,2500),
  (3,0),
  (4,30),
  (5,500),
  (6,1);
 
 SELECT * FROM storehouses_products;

 SELECT * FROM storehouses_products ORDER BY CASE WHEN value = '0' THEN '99999999'END, value;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255),
  birthday_at VARCHAR(255) 
);

INSERT INTO users (id, name, birthday_at) VALUES
  (1,'Геннадий', 'september'),
  (2,'Наталья', 'october'),
  (3,'Александр', 'may'),
  (4,'Сергей', 'december'),
  (5,'Иван', 'august'),
  (6,'Мария', 'mart');
 
 SELECT id, name, birthday_at FROM users WHERE birthday_at = 'may' OR birthday_at = 'august';

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY 
  CASE 
   WHEN id = 5 THEN 1 
   WHEN id = 1 THEN 2 
   WHEN id = 2 THEN 3 
END;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL,
  name VARCHAR(255),
  birthday_at DATE,
  created_at DATETIME, 
  updated_at DATETIME
);

INSERT INTO users (id, name, birthday_at) VALUES
  (1,'Геннадий', '1990-10-05'),
  (2,'Наталья', '1984-11-12'),
  (3,'Александр', '1985-05-20'),
  (4,'Сергей', '1988-02-14'),
  (5,'Иван', '1998-01-12'),
  (6,'Мария', '1992-08-29');
 
 SELECT * FROM users;
 
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS mid_age FROM users;

SELECT COUNT(*) AS total, GROUP_CONCAT(name), DAYNAME(DATE_FORMAT(birthday_at,'2020-%m-%d') AS day_ 
FROM users GROUP BY DAYNAME(DATE_FORMAT(birthday_at,'2020-%m-%d');

CREATE TABLE test (
  id INT UNSIGNED NOT NULL,
  value INT UNSIGNED NOT NULL
);
 
INSERT INTO test (id, value) VALUES
  (1,1),
  (2,2),
  (3,3),
  (4,4),
  (5,5);

 SELECT * FROM test
 
 SELECT exp(SUM(log(value))) FROM test;
 
 