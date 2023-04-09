# Домашнее задание к занятию 12.5. «Реляционные базы данных: индексы» - Екимовский К

---

## Задание 1

Запрос:

```sql
SELECT  SUM(tt.DATA_LENGTH) , SUM(tt.INDEX_LENGTH),
CONCAT(  ROUND ((SUM(tt.INDEX_LENGTH) / SUM(tt.DATA_LENGTH)) *100), ' %')  AS ratio
FROM INFORMATION_SCHEMA.TABLES tt
WHERE  tt.TABLE_SCHEMA = 'sakila';
```

---

## Задание 2

*Distinct может отключать индексы, поэтому убираем его из запроса и группируем по customer_id.
Убираем оператор OVER с partitions, тогда у нас нет необходимости считать каждую группу отдельно по c.customer_id и мы делаем подсчет один раз как единую партицию, а не по каждому c.customer_id.
Также  убираем обращение  к таблице inventory и обращение  inventory_id т.к. они так же не участвуют в фильтрации данных и на результаты выдачи не влияют.*

**Измененный запрос выглядит так:**

```sql
SELECT CONCAT(c.last_name, ' ', c.first_name), SUM(p.amount)
FROM payment p, customer c
WHERE date(p.payment_date) = '2005-07-30' and c.customer_id = p.customer_id 
GROUP BY p.customer_id;
```

---

## Задание 3

В PostgreSQL, в отличие от MySQL, есть следующие индексы:

* GiST
* SP-GiST
* GIN
* BRIN

---
