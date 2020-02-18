CREATE DATABASE auto_ru;

DROP TABLE IF EXISTS car_mark;
CREATE TABLE car_mark (
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS car_model;
CREATE TABLE car_model (
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id_car_mark INT(8) NOT NULL REFERENCES car_mark(id),
   name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS car_generation;
CREATE TABLE car_generation(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   id_car_model INT(8) NOT NULL REFERENCES car_model(id),
   id_car_serie INT(8) NOT NULL REFERENCES car_serie(id),
   year_begin YEAR NOT NULL,
   year_end YEAR NOT NULL
);

DROP TABLE IF EXISTS car_serie;
CREATE TABLE car_serie(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS car_modification;
CREATE TABLE car_modification(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   id_car_model INT(8) NOT NULL REFERENCES car_model(id),
   id_car_generation INT(8) NOT NULL REFERENCES car_generation(id)
);

DROP TABLE IF EXISTS car_characteristic;
CREATE TABLE car_characteristic(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS car_characteristic_value;
CREATE TABLE car_characteristic_value(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   value VARCHAR(255) NOT NULL,
   unit VARCHAR(255) NOT NULL,
   id_car_characteristic INT(8) NOT NULL REFERENCES car_characteristic(id),
   id_car_modification INT(8) NOT NULL REFERENCES car_modification(id)
);

DROP TABLE IF EXISTS car_equipment;
CREATE TABLE car_equipment(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   id_car_modification INT(8) NOT NULL REFERENCES car_modification(id)
);

DROP TABLE IF EXISTS car_option;
CREATE TABLE car_option(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS car_option_value;
CREATE TABLE car_option_value(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   value BOOLEAN NOT NULL,
   id_car_option INT(8) NOT NULL REFERENCES car_option(id),
   id_car_equipment INT(8) NOT NULL REFERENCES car_equipment(id)
);

DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(255) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS users;
CREATE TABLE users(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255) NOT NULL,
   last_name VARCHAR(255) NOT NULL,
   birthdate DATE DEFAULT NULL,
   id_cities INT(8) NOT NULL REFERENCES cities(id),
   phone VARCHAR(255) NOT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP(),
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id_user INT(8) NOT NULL REFERENCES users(id),
   filename VARCHAR(255) NOT NULL,
   size INT(11) NOT NULL,
   metadata TEXT DEFAULT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP(),
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

DROP TABLE IF EXISTS ads;
CREATE TABLE ads(
   id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id_car_modification INT(8) NOT NULL REFERENCES car_modification(id),
   body TEXT DEFAULT NULL,
   id_user INT(8) NOT NULL REFERENCES users(id),
   id_media INT(8) NOT NULL REFERENCES media(id),
   price INT(11) NOT NULL,
   production_date YEAR NOT NULL, 
   mileage INT(11) NOT NULL,
   number_of_owners INT(8) NOT NULL,
   road_traffic_accident INT(8) NOT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP(),
   updated_at DATETIME DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

CREATE INDEX car_mark_name__idx ON car_mark (name);

CREATE INDEX car_model_name__idx ON car_model (name);

CREATE INDEX car_generation_name_year_idx ON car_generation (name, year_begin, year_end);

CREATE INDEX cities_name_idx ON cities (name);

-- я понял, что внешний ключ таким образом не определяется, как я делал изначально. Видимо это актуально для SQL Server.
-- Поэтому исправил все через ALTER TABLE. Странно, что не выдавало ошибку. 

ALTER TABLE car_model MODIFY COLUMN id_car_mark INT(8) UNSIGNED;

ALTER TABLE car_model
  ADD CONSTRAINT car_model_id_car_mark_fk 
    FOREIGN KEY (id_car_mark) REFERENCES car_mark(id)
      ON DELETE CASCADE;

ALTER TABLE car_generation MODIFY COLUMN id_car_model INT(8) UNSIGNED; 
ALTER TABLE car_generation MODIFY COLUMN id_car_serie INT(8) UNSIGNED; 
     
ALTER TABLE car_generation
  ADD CONSTRAINT car_generation_id_car_model_fk 
    FOREIGN KEY (id_car_model) REFERENCES car_model(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT car_generation_id_car_serie_fk 
    FOREIGN KEY (id_car_serie) REFERENCES car_serie(id)
      ON DELETE CASCADE;
     
ALTER TABLE car_modification MODIFY COLUMN id_car_model INT(8) UNSIGNED;   
ALTER TABLE car_modification MODIFY COLUMN id_car_generation INT(8) UNSIGNED; 

ALTER TABLE car_modification
  ADD CONSTRAINT car_modification_id_car_model_fk 
    FOREIGN KEY (id_car_model) REFERENCES car_model(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT car_modification_id_car_generation_fk 
    FOREIGN KEY (id_car_generation) REFERENCES car_generation(id)
      ON DELETE CASCADE;
     
ALTER TABLE car_characteristic_value MODIFY COLUMN id_car_characteristic INT(8) UNSIGNED;   
ALTER TABLE car_characteristic_value MODIFY COLUMN id_car_modification INT(8) UNSIGNED;     
    
ALTER TABLE car_characteristic_value
  ADD CONSTRAINT car_characteristic_value_id_car_characteristic_fk 
    FOREIGN KEY (id_car_characteristic) REFERENCES car_characteristic(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT car_characteristic_value_id_car_modification_fk 
    FOREIGN KEY (id_car_modification) REFERENCES car_modification(id)
      ON DELETE CASCADE;
     
ALTER TABLE car_equipment MODIFY COLUMN id_car_modification INT(8) UNSIGNED;        

ALTER TABLE car_equipment
  ADD CONSTRAINT car_equipment_id_car_modification_fk 
    FOREIGN KEY (id_car_modification) REFERENCES car_modification(id)
      ON DELETE CASCADE;
     
ALTER TABLE car_option_value MODIFY COLUMN id_car_option INT(8) UNSIGNED;        
ALTER TABLE car_option_value MODIFY COLUMN id_car_equipment INT(8) UNSIGNED;  

ALTER TABLE car_option_value
  ADD CONSTRAINT car_option_value_id_car_option_fk 
    FOREIGN KEY (id_car_option) REFERENCES car_option(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT car_option_value_d_car_equipment_fk 
    FOREIGN KEY (id_car_equipment) REFERENCES car_equipment(id)
      ON DELETE CASCADE;   
     
ALTER TABLE users MODIFY COLUMN id_cities INT(8) UNSIGNED; 

ALTER TABLE users
  ADD CONSTRAINT users_id_cities_fk 
    FOREIGN KEY (id_cities) REFERENCES cities(id)
      ON DELETE CASCADE;   
     
ALTER TABLE media MODIFY COLUMN id_user INT(8) UNSIGNED; 

ALTER TABLE media
  ADD CONSTRAINT media_id_user_fk 
    FOREIGN KEY (id_user) REFERENCES users(id)
      ON DELETE CASCADE;  
     
ALTER TABLE ads MODIFY COLUMN id_car_modification INT(8) UNSIGNED; 
ALTER TABLE ads MODIFY COLUMN id_user INT(8) UNSIGNED; 
ALTER TABLE ads MODIFY COLUMN id_media INT(8) UNSIGNED; 

ALTER TABLE ads
  ADD CONSTRAINT ads_id_car_modification_fk 
    FOREIGN KEY (id_car_modification) REFERENCES car_modification(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT ads_id_user_fk 
    FOREIGN KEY (id_user) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT ads_id_media_fk 
    FOREIGN KEY (id_media) REFERENCES media(id)
      ON DELETE CASCADE;

 