# DML: INSERT, SELECT, UPDATE, DELETE
# CRUD

# базовый вариант команды INSERT
INSERT INTO users (id, firstname, lastname, email, phone)
VALUES ('1', 'Kelsie', 'Olson', 'xheidenreich@example.net', '9548492646');

 
INSERT INTO users (id, firstname, lastname, email, phone)
VALUES ('2', 'Kelsie', 'Olson', 'xheidenreich2@example.net', '9548492642');

# опция IGNORE - позволяет игнорировать ошибки в данных
INSERT IGNORE INTO users (id, firstname, lastname, email, phone) 
VALUES ('3', 'Celestino', 'Cruickshank', 'flavio.hammes@example.com', '9686686728');

# можно не указывать автоинкрементное (AUTO_INCREMENT) поле
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Celestino', 'Cruickshank', 'flavio.hammes2@example.com', '9686686722');

# идентификаторы можно добавлять не по порядку
INSERT INTO users (id, firstname, lastname, email, phone) 
VALUES ('93', 'Gregory', 'Jenkins', 'weimann.richard@example.com', '9860971258');

# можно указывать NULL или DEFAULT вместо значений для поля
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Celestino', 'Cruickshank', DEFAULT, NULL);

# добавим колонку is_deleted
ALTER TABLE users ADD COLUMN is_deleted BIT DEFAULT 0;

# значение по умолчанию для поля is_deleted
INSERT INTO users (firstname, lastname, is_deleted) 
VALUES ('Celestino', 'Cruickshank', DEFAULT);

# NULL для поля is_deleted
INSERT INTO users (firstname, lastname, is_deleted) 
VALUES ('Celestino', 'Cruickshank', NULL);

# вставим абсолютно пустую строку
INSERT INTO users () 
VALUES ();

# не указываем имена полей - ошибка
INSERT INTO users
VALUES ('Celestino', 'Cruickshank', DEFAULT);

# не указываем имена полей - рабочий вариант
INSERT INTO users  
VALUES (101, 'Eleonore', 'Ward', NULL, 'antonietta333@example.com',DEFAULT, 9397815333, '2000.01.01', 0);

# перепутали фамилию и почту - сработало
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Pearl', 'Prohaska', 'xeichmann@example.net', '9136605713');

# перепутали телефон и почту - ошибка
INSERT INTO users (firstname, lastname, phone, email) 
VALUES ('Pearl', 'Prohaska', 'xeichmann@example.net', '9136605713');

# пакетная вставка данных - работает быстро
INSERT INTO users (firstname, lastname, email, phone) VALUES 
('Ozella', 'Hauck', 'idickens@example.com', '9773438197'),
('Emmet', 'Hammes', 'qcremin@example.org', '9694110645'),
('Lori', 'Koch', 'damaris34@example.net', '9192291407'),
('Sam', 'Kuphal', 'telly.miller@example.net', '9917826315');

# одиночная вставка данных - работает медленно
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Ozella', 'Hauck', 'idickens2@example.com', '9773438192');
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Emmet', 'Hammes', 'qcremin2@example.org', '9694110642');
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Lori', 'Koch', 'damaris342@example.net', '9192291402');
INSERT INTO users (firstname, lastname, email, phone) 
VALUES ('Sam', 'Kuphal', 'telly.miller2@example.net', '9917826312');

# второй вариант команды INSERT (можно вставить только 1 строку)
INSERT INTO users 
SET 
	firstname = 'Miguel',
	lastname = 'Watsica',
	email = 'hassan.kuphal@example.org',
	login = 'hassan_kuphal',
	phone = '9824696112'
;

# INSERT-SELECT
INSERT INTO users 
	(firstname, lastname, email, phone) 
SELECT 
	'Sam2', 'Kuphal2', 'telly.miller222@example.net', '9917826222';

# INSERT-SELECT
INSERT INTO users (firstname, lastname, email)
SELECT first_name , last_name , email
FROM sakila.staff;

# опция ON DUPLICATE KEY UPDATE позволяет выполнить обновление
INSERT INTO users (id, firstname, lastname, email, phone) 
VALUES (2, 'Lucile', 'Rolfson', 'dbartell@example.net', 9258387168)
ON DUPLICATE KEY UPDATE 
	firstname = 'Lucile',
	lastname = 'Rolfson',
	email = 'dbartell@example.net',
	phone = 9258387168
;












































































