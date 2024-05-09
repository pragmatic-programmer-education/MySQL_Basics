# Вывод текста:
SELECT 'Hello world';

# вывести всю таблицу users (все поля, все строки):
SELECT *
FROM users;

# явно указываем поля, которые необходимо вывести:
SELECT id, firstname, lastname, login, email, password_hash, phone, birthday
FROM users;

SELECT id, firstname, phone
FROM users;

# выводим пользователя по его идентификатору:
SELECT *
FROM users
WHERE id = 1;

# выводим первые 5 строк из таблицы:
SELECT *
FROM users
LIMIT 5;

# сортируем вывод по полю email:
SELECT *
FROM users
ORDER BY email;

# выводим количество строк с указанным именем:
SELECT count(firstname)
FROM users;

# выводим количество строк с уникальными именами:
SELECT count(DISTINCT firstname)
FROM users;

# выводим общее количество строк в таблице:
SELECT COUNT(*)
FROM users;