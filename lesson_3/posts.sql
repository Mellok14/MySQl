CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  autor_id INT UNSIGNED NOT NULL, --внешний ключ на таблицу users или communities
  body TEXT NOT NULL,
  media_id INT UNSIGNED NOT NULL, --внешний ключ на таблицу media
  likes_count INT UNSIGNED DEFAULT 0, 
  created_at DATETIME DEFAULT NOW()
);

CREATE TABLE user_activity (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,--внешний ключ на таблицу users
  post_id INT UNSIGNED NOT NULL,--внешний ключ на таблицу posts
  like_status BOOLEAN,
);
  
  
