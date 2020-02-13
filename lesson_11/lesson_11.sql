-- Задание 1.1

CREATE TABLE Logs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    table_name varchar(50) NOT NULL,
    row_id INT UNSIGNED NOT NULL,
    row_name varchar(255)
) ENGINE = Archive;

CREATE TRIGGER products_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "products", NEW.id, NEW.name);
END;

CREATE TRIGGER users_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "users", NEW.id, NEW.name);
END;

CREATE TRIGGER catalogs_insert AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "catalogs", NEW.id, NEW.name);
END;

-- Задание 1.2
DELIMITER //

CREATE PROCEDURE users_add()
BEGIN
 DECLARE n INT DEFAULT 1;
 while n < 1000000
    INSERT users VALUES (n, 'test', '22-01-2019', DEFAULT, DEFAULT);
    SET n = n + 1;
 END WHILE;
END//

-- Задание 2.1

HSET ip_adress 192.168.0.1 1 

-- Задание 2.2

SET Alexander melnik_15@mail.ru

SET melnik_15@mail.ru Alexander

GET Alexander

GET melnik_15@mail.ru

-- Задание 2.3

db.shop.insert({category: 'Для дома'})

db.shop.insert({category: 'Для сада'})

db.shop.update({category: 'Для дома'}, {$set: { positions:['ковры', 'кресла', 'стулья'] }})

db.shop.update({category: 'Для сада'}, {$set: { positions:['растения', 'скамейки', 'гриль'] }})


