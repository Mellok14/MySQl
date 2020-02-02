-- Задание 1
     
 SELECT DISTINCT u.name 
  FROM users u JOIN orders o
    ON u.id = o.user_id;
     
-- Задание 2
  
 SELECT DISTINCT  p.name, p.description, c.name
  FROM products p JOIN catalogs c
   ON c.id = p.catalog_id;

-- Задание 3

SELECT
  f.id,
  cit_from.name AS from_,
  cit_to.name AS to_
FROM flights AS f
  JOIN cities AS cit_from
    ON f.from_ = cit_from.label
  JOIN cities AS cit_to
    ON f.to_ = cit_to.label;
 
