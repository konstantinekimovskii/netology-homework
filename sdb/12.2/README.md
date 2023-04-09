# Домашнее задание к занятию "Работа с данными (DDL/DML)" - Екимовский К

## Задание №1

- Список пользователей:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/1.png)

- Список прав пользователя sys_temp:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/2.png)

- Восстановление БД sakila:

```sql
SOURCE /root/sakila-db/sakila-schema.sql 
SOURCE /root/sakila-db/sakila-data.sql
```

ER-диаграмма:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/3.png)
![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/sakila.png)

Запросы:

```sql
CREATE user 'sys_temp'@'%' identified by '7856';
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'%';
SELECT user FROM mysql.user;
SHOW GRANTS FOR 'sys_temp'@'%';
SOURCE /root/sakila-db/sakila-schema.sql
SOURCE /root/sakila-db/sakila-data.sql
SHOW DATABASES;
USE sakila;
SHOW FULL TABLES;
```

---

## Задание №2

Запросы:

```sql
USE sakila;
SHOW FULL TABLES;

SELECT k.column_name
FROM information_schema.table_constraints t
JOIN information_schema.key_column_usage k
USING(constraint_name,table_schema,table_name)
WHERE t.constraint_type='PRIMARY KEY'
  AND t.table_schema='sakila';

```

Скриншот:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/5.png)

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/6.png)

---

### Задание №3

Так как мы не давали пользователю sys_temp прав на БД sakila (изначально дали на все БД и таблицы), то и забрать права именно на БД sakila не получиться.
Поэтому сначала нужно дать права, затем забрать:

```sql
GRANT ALL PRIVILEGES ON sakila.* TO `sys_temp`@`%`;
REVOKE INSERT, DELETE, UPDATE ON sakila.* FROM `sys_temp`@`%`;
REVOKE INSERT, DELETE, UPDATE ON *.* FROM `sys_temp`@`%`;
```

Скриншот:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.2/img/4.png)

---
