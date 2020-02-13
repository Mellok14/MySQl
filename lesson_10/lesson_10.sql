-- 1 задание 

-- Имеет смысл добавить индекс на имя, фамилию т.к. при использовании соц. сети при поиске людей это главный параметр.
CREATE INDEX user_first_name_last_name_idx ON users (first_name, last_name);

-- Можно добавить индекс друзей пользователя. 

CREATE INDEX friendship_user_id_friend_id_idx ON friendship (user_id, friend_id);

CREATE INDEX friendship_friend_id_user_id_idx ON friendship (friend_id, user_id);

-- 2 задание
-- в 3ей строке просто методом перебора получилось найти правильное решение (SELECT COUNT(*) FROM communities), скажите пожалуйста,
-- почему выдает ошибку если пытаешься разделить просто на COUNT(communities.id) OVER() без SELECT?
-- При этом в последней подзадаче COUNT(communities_users.user_id) OVER(PARTITION BY communities.id) / COUNT(profiles.user_id) OVER() *100 AS '%%' - все получается, при похожей ситуации

 SELECT DISTINCT 
  communities.name,
  COUNT(communities_users.user_id) OVER() / (SELECT COUNT(*) FROM communities) AS avg_users_in_groups,  
  FIRST_VALUE(users.first_name) 
    OVER birthday_desc AS youngest_first_name,
  FIRST_VALUE(users.last_name) 
    OVER birthday_desc AS youngest_last_name,
  FIRST_VALUE(users.first_name) 
    OVER birthday_asc AS oldest_first_name,
  FIRST_VALUE(users.last_name) 
    OVER birthday_asc AS oldest_last_name,
  COUNT(communities_users.user_id) OVER(PARTITION BY communities.id) AS users_in_groups,
  COUNT(profiles.user_id) OVER() AS users_total,
  COUNT(communities_users.user_id) OVER(PARTITION BY communities.id) / COUNT(profiles.user_id) OVER() *100 AS '%%'
    FROM communities
      JOIN communities_users 
        ON communities_users.community_id = communities.id
      JOIN users 
        ON communities_users.user_id = users.id
      JOIN profiles 
        ON profiles.user_id = users.id
      WINDOW birthday_desc AS (PARTITION BY communities.id ORDER BY profiles.birthdate DESC),
             birthday_asc AS (PARTITION BY communities.id ORDER BY profiles.birthdate);           
 
-- 3 задание

 -- Можно создать дополнительные столбцы в каждой из таблиц сообщения, медиа и лайки. И в них хранить даннные о общем количестве сообщений, медиа и лайков для пользователя.
 -- Или создать столбец в таблице users или profiles, который можно изменять при каждом действии пользователя связанном с активностью, с помощью триггера.  
       
         