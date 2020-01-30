-- Задание 1 

SELECT name 
  FROM users 
    WHERE id IN(
      SELECT user_id FROM orders);
     
-- Задание 2

SELECT name, description, (SELECT name FROM catalogs WHERE id = catalog_id) AS catalog
  FROM products 

-- Задание 3
 
 SELECT id,
   (SELECT name FROM cities WHERE label = from_) AS from_,
   (SELECT name FROM cities WHERE label = to_) AS to_
     FROM flights;
 
