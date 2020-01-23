UPDATE users SET created_at = NOW(), updated_at = NOW();

ALTER TABLE users MODIFY COLUMN created_at DATETIME;

ALTER TABLE users MODIFY COLUMN updated_at DATETIME;

SELECT * FROM storehouses_products ORDER BY CASE WHEN value = '0' THEN '99999999'END, value;
 
SELECT id, name, birthday_at FROM users WHERE birthday_at = 'may' OR birthday_at = 'august';

SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY 
  CASE 
   WHEN id = 5 THEN 1 
   WHEN id = 1 THEN 2 
   WHEN id = 2 THEN 3 
END;
 
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS mid_age FROM users;

SELECT COUNT(*) AS total, GROUP_CONCAT(name), DAYNAME(DATE_FORMAT(birthday_at,'2020-%m-%d') AS day_ 
FROM users GROUP BY DAYNAME(DATE_FORMAT(birthday_at,'2020-%m-%d');

SELECT exp(SUM(log(value))) FROM test;
 
 