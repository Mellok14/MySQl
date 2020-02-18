-- Обновим значения кузова автомобиля, чтобы было удобнее использовать в запросах

TRUNCATE car_serie;

INSERT INTO car_serie (name) 
  VALUES ('седан'), ('хэтчбек'), ('внедорожник'), ('универсал'), ('родстер'), ('купе'), ('минивен'), ('пекап'), ('лимузин'), ('кабриолет');

-- Обновим даты создания объявлений, медиафайлов и регистрации пользователей
 
 UPDATE media SET created_at = updated_at WHERE created_at > updated_at;
 
 UPDATE users SET created_at = updated_at WHERE created_at > updated_at;
 
 UPDATE ads SET created_at = updated_at WHERE created_at > updated_at;

-- Обновим даты выпуска генераций автомобиля

 UPDATE car_generation SET year_end = year_begin + 3 WHERE year_begin > year_end;

-- Т.к. в реальных условиях модель автомобиля 2го поколения не может быть выпущена раньше 1го поколения, необходимо обновить даты выпуска поколений. 
-- Примем 3 года - срок выпуска одного поколения.

WITH tbl1 AS 
(SELECT *, 
       ROW_NUMBER() OVER (PARTITION BY id_car_model ORDER BY name) rn
FROM car_generation),
tbl2 AS 
(SELECT DISTINCT
       id_car_model, 
       FIRST_VALUE(year_end) OVER (PARTITION BY id_car_model ORDER BY name) end1
FROM car_generation)
UPDATE car_generation
JOIN tbl1 ON car_generation.id = tbl1.id
JOIN tbl2 ON tbl1.id_car_model = tbl2.id_car_model
       SET car_generation.year_begin = CASE WHEN tbl1.rn=1 THEN tbl1.year_begin
                                       ELSE tbl2.end1 + 3 * (rn - 2)
                                       END,
             car_generation.year_end = CASE WHEN tbl1.rn=1 THEN tbl1.year_end
                                       ELSE tbl2.end1 + 3 * (rn - 1)
                                       END;
                                      
SELECT * FROM car_generation ORDER BY id_car_model, name;

-- Cкрипты характерных выборок

SELECT first_name, 
       last_name 
FROM users WHERE id IN (
   SELECT id 
      FROM ads WHERE id_media IN (
         SELECT id FROM media WHERE size > 1000));
        
SELECT ads.id, 
       ads.price, 
       car_serie.name, 
       ads.id_user
  FROM ads 
  JOIN car_modification ON ads.id_car_modification = car_modification.id
  JOIN car_generation ON car_modification.id_car_generation = car_generation.id
  JOIN car_serie ON car_generation.id_car_serie = car_serie.id
  WHERE car_serie.name = 'седан';
 
 SELECT ads.id_user,
        COUNT(*) AS total_ads
  FROM ads 
  JOIN users ON users.id = ads.id_user
  WHERE users.id IN (SELECT id_user FROM media WHERE YEAR(created_at) BETWEEN 1900 AND 2005)
  GROUP BY ads.id_user 
  ORDER BY total_ads;
 
-- Представления

CREATE VIEW richest_user
  AS SELECT u.first_name, u.last_name, ads.price 
    FROM users u 
    JOIN ads ON ads.id_user = u.id
    WHERE ads.price = (SELECT MAX(ads.price) FROM ads);
  
 SELECT * FROM richest_user;

CREATE VIEW option_for_modification
  AS SELECT ce.name, co.name AS option_, cov.value AS value
    FROM car_option_value cov  
    JOIN car_option co ON cov.id_car_option = co.id
    JOIN car_equipment ce ON cov.id_car_equipment = ce.id
    WHERE ce.id_car_modification = 15 AND cov.value IS TRUE;

SELECT * FROM option_for_modification;

-- Хранимые процедуры, триггеры

DELIMITER \\

DROP PROCEDURE IF EXISTS most_expensive_car\\

CREATE PROCEDURE most_expensive_car()
BEGIN
   SELECT id_car_modification, SUM(price)/COUNT(id_car_modification) as mid_price
   FROM ads GROUP BY id_car_modification ORDER BY mid_price DESC LIMIT 1;
END\\

DELIMITER ;

CALL most_expensive_car();

DELIMITER //

CREATE TRIGGER incorrect_value_of_year BEFORE INSERT ON car_generation
FOR EACH ROW
BEGIN
    IF NEW.year_begin < (
      SELECT MAX(year_end) 
      FROM car_generation 
      WHERE id_car_model = NEW.id_car_model)
    THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Дата выпуска нового поколения модели не может начаться раньше окончания выпуска старого';
  END IF;
END//
   
DELIMITER ;
 


      



