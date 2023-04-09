# Домашнее задание к занятию 12.4. «Реляционные базы данных: SQL. Часть 2» - Екимовский К

---

## Задание 1

Запрос:

```sql
SELECT s.store_id, CONCAT(st.first_name, ' ', st.last_name) AS staff_name, c.city, COUNT(cus.customer_id) 
FROM store s
JOIN staff st ON st.staff_id = s.manager_staff_id 
JOIN address a ON a.address_id = s.address_id 
JOIN city c ON c.city_id = a.city_id
JOIN customer cus ON cus.store_id = s.store_id 
GROUP BY cus.store_id
HAVING COUNT(cus.customer_id) > 300;
```

Результат:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.4/img/1.png)

Запрос выводит информацию о магазине, в котором обслуживается более 300 покупателей + фамилия и имя сотрудника из этого магазина, город нахождения магазина, количество пользователей, закреплённых в этом магазине.

---

## Задание 2

Запрос:

```sql
SELECT COUNT(f.film_id) 
FROM film f
WHERE f.`length` > (SELECT AVG(f.length) FROM film f);
```

Результат:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.4/img/2.png)

Запрос выводит количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

---

## Задание 3

Запрос:

```sql
SELECT MONTH(p.payment_date), SUM(p.amount), COUNT(r.rental_id)
FROM payment p
JOIN rental r ON r.rental_id = p.payment_id 
GROUP BY MONTH(p.payment_date)
```

Результат:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.4/img/3.png)

Запрос выводит информацию за какой месяц была получена наибольшая сумма платежей, сумму и инфу по количеству аренд за этот месяц.

---

## Задание 4

Запрос:

```sql
SELECT CONCAT(st.first_name, ' ', st.last_name) AS staff_name, COUNT(r.rental_id),
  CASE
    WHEN COUNT(r.rental_id) > 8000 THEN 'YES'
    ELSE 'NO'
  END AS award
FROM staff st
JOIN rental r ON r.staff_id = st.staff_id
GROUP BY r.staff_id
```

Результат:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.4/img/4.png)

Запрос выводит продавцов и их продажи + добавляет колонку "award" в которой указывается заслуживает ли он премии, при условии, что продаж больше 8000.

---
