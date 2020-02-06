 -- 1.1 задание 

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE shop.users.id = 1;
DELETE FROM shop.users WHERE shop.users.id = 1;
COMMIT;

 -- 1.2 задание 

CREATE VIEW prod_cat (name, catalog)
AS SELECT p.name, c.name 
  FROM products p JOIN catalogs c
    ON p.catalog_id = c.id ;

-- 1.3 задание
 
SELECT id, 
       created_at, 
       @status := IF(created_at IN('2018-08-01', '2018-08-04', '2018-08-16', '2018-08-17'), 1 ,0) AS status_date
         FROM dates;
        
-- 1.4 задание

CREATE VIEW new_dates
  AS SELECT * 
    FROM dates
      ORDER BY created_at DESC LIMIT 5;
 
DELETE FROM dates 
  WHERE created_at NOT IN(SELECT created_at FROM new_dates)
  
-- 3.1 задание

DELIMITER //

CREATE FUNCTION hello()
RETURNS TEXT DETERMINISTIC
BEGIN
    CASE 
        WHEN DATE_FORMAT(NOW(), "%T") BETWEEN '06:00:00' AND '12:00:00' THEN RETURN "Доброе утро"; 
        WHEN DATE_FORMAT(NOW(), "%T") BETWEEN '12:00:00' AND '18:00:00' THEN RETURN "Добрый день"; 
		WHEN DATE_FORMAT(NOW(), "%T") BETWEEN '18:00:00' AND '24:00:00' THEN RETURN "Добрый вечер"; 
        ELSE RETURN "Доброй ночи";  
    END CASE;
END//

-- 3.2 задание

CREATE TRIGGER not_null_on_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
  IF NEW.name IS NULL AND NEW.desription IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one value can be NULL';
  END IF;
END//

CREATE TRIGGER not_null_on_insert BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
  IF NEW.name IS NULL AND NEW.desription IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only one value can be NULL';
  END IF;
END//

-- 3.3 задание

CREATE FUNCTION FIBONACCI(n INT)
RETURNS TEXT DETERMINISTIC
BEGIN
  DECLARE num_1 INT DEFAULT 1;
  DECLARE num_2 INT DEFAULT 1;
  DECLARE i INT DEFAULT 2;
  DECLARE result_ INT DEFAULT 0;
    IF (n <= 1) THEN RETURN n;
    ELSEIF (n = 2) THEN RETURN 1;
    END IF;  
    WHILE i < n DO
      SET i = i + 1;
      SET result_ = num_2 + num_1;
      SET num_2 = num_1;
      SET num_1 = result_;
    END WHILE;
    RETURN result_;
 END//
