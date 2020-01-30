DROP TABLE IF EXISTS likes;

CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS target_types;

CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');

INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

 -- 2 задание.

SELECT first_name, last_name FROM users WHERE id = (
SELECT to_user_id FROM messages WHERE to_user_id IN
(
(SELECT to_user_id
  FROM messages 
   WHERE from_user_id = 30)
 UNION ALL
(SELECT from_user_id
  FROM messages 
   WHERE to_user_id = 30)
)
AND id IN(
 (SELECT friend_id
  FROM friendship 
  WHERE user_id = 3
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'))
 UNION
(SELECT user_id 
  FROM friendship 
  WHERE friend_id = 3
    AND status_id IN (
      SELECT id FROM friendship_statuses 
        WHERE name = 'Confirmed'))
)
GROUP BY to_user_id ORDER BY COUNT(*) DESC LIMIT 1);

 -- 3 задание.

SELECT * FROM likes LIMIT 15;

SELECT * FROM profiles;

SELECT COUNT(target_id) AS total
  FROM likes 
    WHERE target_type_id IN (
      SELECT id FROM target_types 
        WHERE name = 'users'
        )
    AND target_id IN (
      SELECT user_id FROM profiles
        ORDER BY TIMESTAMPDIFF(YEAR, birthdate, NOW()) LIMIT 10 -- из-за LIMIT 10 выдает ошибку, никак не могу понять почему
        );
   
 -- 4 задание.

SELECT COUNT(likes.user_id) AS total_likes, 
  CASE (profiles.sex)
      WHEN 'm' THEN 'man'
      WHEN 'f' THEN 'women'
    END AS sex
     FROM likes, profiles
       WHERE profiles.user_id = likes.user_id
         GROUP BY profiles.sex
           ORDER BY total_likes DESC LIMIT 1;

     
-- 5 задание

SELECT users.first_name, 
       users.last_name, 
       COUNT(messages.from_user_id) as total_mess
         FROM users, messages 
            WHERE users.id = messages.from_user_id 
              GROUP BY messages.from_user_id 
                ORDER BY total_mess LIMIT 10;

