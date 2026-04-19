-- Домашнє завдання 7. Додаткові вбудовані SQL функції. Робота з часом
-- База даних: northwind, таблиця: orders

-- 1. Витягуємо рік, місяць і число з атрибута date таблиці orders
SELECT 
  order_id AS id,
  order_date AS date,
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  DAY(order_date) AS day
FROM orders;

-- 2. Додаємо один день до атрибута date таблиці orders
SELECT 
  order_id AS id,
  order_date AS date,
  DATE_ADD(order_date, INTERVAL 1 DAY) AS date_plus_one
FROM orders;

-- 3. Відображаємо кількість секунд з початку відліку (UNIX timestamp)
SELECT 
  order_id AS id,
  order_date AS date,
  UNIX_TIMESTAMP(order_date) AS timestamp_seconds
FROM orders;

-- 4. Рахуємо кількість рядків з date між 1996-07-10 та 1996-10-08
SELECT COUNT(*) AS total_rows
FROM orders
WHERE order_date BETWEEN '1996-07-10 00:00:00' AND '1996-10-08 00:00:00';

-- 5. Виводимо id, date та JSON-об'єкт {"id": ..., "date": ...}
SELECT 
  order_id AS id,
  order_date AS date,
  JSON_OBJECT('id', order_id, 'date', order_date) AS json_data
FROM orders;
