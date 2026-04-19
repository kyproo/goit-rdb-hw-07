-- Домашнє завдання 7. Додаткові вбудовані SQL функції. Робота з часом

-- 1. Витягуємо рік, місяць і число з атрибута date таблиці orders
SELECT 
  id,
  date,
  YEAR(date) AS year,
  MONTH(date) AS month,
  DAY(date) AS day
FROM orders;

-- 2. Додаємо один день до атрибута date таблиці orders
SELECT 
  id,
  date,
  DATE_ADD(date, INTERVAL 1 DAY) AS date_plus_one
FROM orders;

-- 3. Відображаємо кількість секунд з початку відліку (timestamp) для атрибута date
SELECT 
  id,
  date,
  UNIX_TIMESTAMP(date) AS timestamp_seconds
FROM orders;

-- 4. Рахуємо кількість рядків з date між 1996-07-10 та 1996-10-08
SELECT COUNT(*) AS total_rows
FROM orders
WHERE date BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

-- 5. Виводимо id, date та JSON-об'єкт {"id": ..., "date": ...}
SELECT 
  id,
  date,
  JSON_OBJECT('id', id, 'date', date) AS json_data
FROM orders;
