# Домашнее задание к занятию "Реляционные базы данных: SQL. Часть 1" - Екимовский К

## Задание №1

```sql
SELECT DISTINCT district FROM address WHERE district LIKE 'K%' AND district LIKE '%a' AND district NOT LIKE '% %';
```

## Задание №2

```sql
SELECT * FROM payment WHERE DATE (payment_date) BETWEEN '2005-06-15' AND '2005-06-18' AND amount > 10;
```

## Задание №3

```sql
SELECT payment_date, rental_id, customer_id  FROM payment ORDER BY payment_date DESC LIMIT 5;
```

## Задание №4

```sql
SELECT REPLACE (LOWER(first_name), 'll', 'pp') AS first_name_rep_lower, LOWER(last_name) AS last_name_lower FROM customer WHERE active = 1 AND first_name LIKE 'Kelly' OR first_name LIKE 'Willie';
```

---
