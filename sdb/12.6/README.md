# Домашнее задание к занятию 12.6. «Репликация и масштабирование. Часть 1» - Екимовский К

## Задание №1

При использовании репликации master-slave используется "master сервер" куда поступают все данные и изменения в данных (добавление, обновление, удаление) должны происходить на этом сервере.
На "slave сервере" эти данные дублируются, после чего их можно читать с него.
Таким образом master сервер отвечает за изменения данных, а slave за чтение.

В репликации master-master любой из серверов может использоваться как для чтения, так и для записи данных.

---

## Задание №2

/etc/mysql/mysql.conf.d/mysqld.cnf:

```bash
[mysqld]
pid-file = /var/run/mysqld/mysqld.pid
socket  = /var/run/mysqld/mysqld.sock
datadir  = /var/lib/mysql
log-error = /var/log/mysql/mysqld.log

bind-address=0.0.0.0
server-id=2 # разные id на разных машинах
log-bin=/var/log/mysql/mybin.log
```

Команды:

```bash
#master:
create user 'replication'@'%' IDENTIFIED with mysql_native_password by '7856';

#slave:
change master to master_host='192.168.0.24', master_user='replication', master_password='7856', master_log_file='mybin.000001', master_log_pos = 157;
start slave;
```

Скриншот:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.6/img/2022-12-27_13-07.png)

---

## Задание №3

Команды:

```bash
#slave:
create user 'replication'@'%' IDENTIFIED with mysql_native_password by '7856';

#master:
change master to master_host='192.168.0.68', master_user='replication', master_password='7856', master_log_file='mybin.000001', master_log_pos = 1132;
start slave;

```

Скриншот:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.6/img/2022-12-27_13-25.png)

---
