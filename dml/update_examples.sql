# UPDATE

# переключимся на БД telegram в данном скрипте
USE telegram;

# вставим новую строку в таблицу channels 
# (создадим новый канал)
INSERT INTO channels(title, invite_link, owner_user_id, is_private)
VALUES ('MySQL news', 'https://t.me/mysql_news', 1, true);

# вставим новые строки в таблицу channel_subscribers 
# (пользователи отправляют заявки на вступление в канал)
INSERT INTO channel_subscribers(channel_id, user_id, status)
VALUES (1, 2, 'requested');
INSERT INTO channel_subscribers(channel_id, user_id, status)
VALUES (1, 3, 'requested');
INSERT INTO channel_subscribers(channel_id, user_id, status)
VALUES (1, 4, 'requested');

# обновит все строки в таблице channel_subscribers (плохо!)
UPDATE channel_subscribers
SET 
	status = 'joined'
;

# админ подтверждает добавление подписчика в канал
UPDATE channel_subscribers
SET 
	status = 'joined'
WHERE channel_id = 1 AND user_id = 2;
UPDATE channel_subscribers
SET 
	status = 'joined'
WHERE channel_id = 1 AND user_id = 3;

# пользователь покидает канал
UPDATE channel_subscribers
SET 
	status = 'left'
WHERE channel_id = 1 AND user_id = 2
;

# добавим новый статус 'удален'
ALTER TABLE channel_subscribers 
MODIFY COLUMN status ENUM('requested', 'joined', 'left', 'removed');

# пользователя принудительно удалили из канала
UPDATE channel_subscribers
SET 
	status = 'removed'
WHERE channel_id = 1 AND user_id = 4
;

# переименуем канал
UPDATE channels
SET title = 'General SQL news'
WHERE id = 1;










































































































































































































