
-- 1 задание  

  SELECT u.first_name, u.last_name, COUNT(*) AS total_messages
  FROM messages m
    JOIN friendship f
      ON m.to_user_id = f.user_id 
        OR m.to_user_id = f.friend_id
    JOIN users u
      ON u.id = m.from_user_id
  WHERE m.to_user_id = 2
   GROUP BY m.from_user_id
   ORDER BY total_messages DESC LIMIT 1; -- ( определяет пользователя правильно, но почему то считает одно и то же сообщение несколько раз. Вместо 1 пишет 5)
  
  
-- 2 задание

SELECT SUM(likes_per_user) AS likes_total FROM (
 SELECT COUNT(l.target_id) AS likes_per_user
  FROM profiles p
   LEFT JOIN likes l
     ON p.user_id = l.target_id AND l.target_type_id = 2
    GROUP BY p.user_id
    ORDER BY p.birthdate DESC LIMIT 10) AS counted_likes;
    
 -- 3 задание
 
   SELECT CASE(p.sex)
		WHEN 'm' THEN 'man'
		WHEN 'f' THEN 'woman'
	END AS sex, 
	COUNT(*) as likes_count 
          FROM likes l 
            JOIN profiles p
              ON l.user_id = p.user_id
  GROUP BY sex
  ORDER BY likes_count DESC
  LIMIT 1;

 -- 4 задание

SELECT CONCAT(u.first_name, ' ', u.last_name) AS user, COUNT(l.user_id) + COUNT(m.user_id) + COUNT(messages.from_user_id) AS total_activity
  FROM users u
    LEFT JOIN likes l
       ON l.user_id = u.id
    LEFT JOIN media m
       ON m.user_id = u.id
    LEFT JOIN messages
       ON messages.from_user_id = u.id
    GROUP BY user   
    ORDER BY total_activity LIMIT 10;

