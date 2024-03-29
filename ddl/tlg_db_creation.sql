-- DDL
-- CREATE, ALTER, DROP

DROP DATABASE IF EXISTS telegram;
CREATE DATABASE telegram;
USE telegram;

DROP TABLE IF EXISTS users; -- тоже DDL команда
CREATE TABLE users (		-- создать таблицу
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    #id SERIAL, # BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
    firstname VARCHAR(100),
   	lastname VARCHAR(100) COMMENT 'фамиль...', -- COMMENT на случай, если имя неочевидное (фича MySQL)
    login VARCHAR(120) UNIQUE,
    email VARCHAR(120) UNIQUE,
    password_hash VARCHAR(256),
    phone BIGINT UNSIGNED UNIQUE, -- 79 201 234 567 
	
	INDEX idx_users_username(firstname, lastname) -- для быстрого поиска людей по ФИО
) COMMENT 'юзеры';

DROP TABLE IF EXISTS user_settings;
CREATE TABLE user_settings (
	user_id BIGINT UNSIGNED NOT NULL,
	is_premium_account /*bool*/ bit,
	is_night_mode_enabled bit,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
  	created_at DATETIME DEFAULT NOW()
);





DROP TABLE IF EXISTS `private_messages`;
CREATE TABLE private_messages (
  	id SERIAL,
  	sender_id BIGINT UNSIGNED NOT NULL,
  	receiver_id BIGINT UNSIGNED NOT NULL,
#  	reply_to_id BIGINT UNSIGNED NULL,
	media_type ENUM('text', 'image', 'audio', 'video'),
  	body text,
  	filename VARCHAR(100)  NULL,
	created_at datetime DEFAULT NOW(),
  	
  PRIMARY KEY (id) # обсудить
  
  	# FK
  	# FK
  	# FK
);
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
    id SERIAL,
    title VARCHAR(45),
    icon VARCHAR(45),
    invite_link VARCHAR(45),
    settings JSON,
    #  owner_user_id INT, # TODO: получить ошибку с внешним ключом, потом исправить тип поля
    owner_user_id BIGINT UNSIGNED NOT NULL,
    is_private bit(1),
    created_at DATETIME DEFAULT NOW(),
  
    FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS group_members;
CREATE TABLE group_members (
    id SERIAL,
    group_id int,
    user_id int,
    created_at DATETIME DEFAULT NOW()
  
    # FK
    # FK
);

DROP TABLE IF EXISTS group_messages;
CREATE TABLE group_messages (
    id SERIAL,
    group_id BIGINT UNSIGNED NOT NULL,
    sender_id BIGINT UNSIGNED NOT NULL,
    reply_to_id BIGINT UNSIGNED NULL,
    media_type ENUM('text', 'image', 'audio', 'video'),
    body text,
    filename VARCHAR(100) NULL,
    created_at DATETIME DEFAULT NOW()

    # FK
);

DROP TABLE IF EXISTS channels;
CREATE TABLE channels (
    id SERIAL,
    title VARCHAR(45),
    icon VARCHAR(45),
    invite_link VARCHAR(45),
    settings json,
    owner_user_id BIGINT UNSIGNED NOT NULL,
    #is_private BIT(1), 	# todo: обсудить разницу
    # type ENUM('public', 'private'), 		# todo: название поля - зарезервированное слово
    # channel_type ENUM('public', 'private'), 		# todo: обсудить разницу
    created_at DATETIME DEFAULT NOW(),
  
    FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS channel_subscribers;
CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL,
  	user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'joined', 'left'),
  	created_at DATETIME DEFAULT NOW()
	
    # FK
    # FK
);
DROP TABLE IF EXISTS channel_messages;
CREATE TABLE channel_messages (
    id SERIAL,
    channel_id BIGINT UNSIGNED NOT NULL,
    media_type ENUM('text', 'image', 'audio', 'video', 'other'),
    body text,
    filename VARCHAR(100) NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (channel_id) REFERENCES channels (id)
);


DROP TABLE IF EXISTS saved_messages;
CREATE TABLE saved_messages (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	body text,
	created_at datetime DEFAULT NOW()
	  
	# FK
);

DROP TABLE IF EXISTS reactions_list;
CREATE TABLE reactions_list (
	id SERIAL,
	code VARCHAR(1)
) DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP TABLE IF EXISTS private_message_reactions;
CREATE TABLE private_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL,
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at datetime DEFAULT NOW()
	  
	# FK reaction_id
	# FK message_id
	# FK user_id
);

DROP TABLE IF EXISTS channel_message_reactions;
CREATE TABLE channel_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL,
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at datetime DEFAULT NOW()
	  
	# FK reaction_id
	# FK message_id
	# FK user_id
);

DROP TABLE IF EXISTS group_message_reactions;
CREATE TABLE group_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL,
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at datetime DEFAULT NOW()
	  
	# FK reaction_id
	# FK message_id
	# FK user_id
);

DROP TABLE IF EXISTS stories;
CREATE TABLE stories (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	caption VARCHAR(140),
	#file BLOB,
	filename VARCHAR(100),
	views_count INT UNSIGNED,
	created_at datetime DEFAULT NOW()
	  
	# FK
);

DROP TABLE IF EXISTS stories_likes;
CREATE TABLE stories_likes (
	id SERIAL,
	story_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at datetime DEFAULT NOW()
	  
	# FK
	# FK
);











