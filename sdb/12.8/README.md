# Домашнее задание к занятию 12.8. «Резервное копирование баз данных» - Екимовский К

---

## Задание 1

1.1 Можно использовать полную резервную копию (на какой-либо период) + последнюю дифференциальную резервную копию за предыдущий день. Данное резервное копирование быстрее, чем полное, но медленнее, чем инкрементное.

1.2 Инкрементное резервное копирование. Можно выполнять так часто, как потребуется, так как сохраняются только копии последних изменений.

1.3* Да, для этого нужно использовать репликацию master-slave.

---

## Задание 2

2.1 Команды:

```bash
pg_dump -Fc bd_name > dump.sql # делает дамп базы данных;
pg_restore –d bd_name dump.sql # восстановление 
```

2.2* Через скрипт можно автоматизировать создания резервных копий и добавить его в планировщик заданий. Также настроить задания через pgAgent или другую утилиту.

---

## Задание 3

3.1 Пример из <https://dev.mysql.com/doc/mysql-enterprise-backup/8.0/en/mysqlbackup.incremental.html>:

```bash
mysqlbackup --defaults-file=/home/dbadmin/my.cnf \
  --incremental=optimistic --incremental-base=history:last_backup \
  --backup-dir=/home/dbadmin/temp_dir \
  --backup-image=incremental_image1.bi 
   backup-to-image
```

Также можно использовать сторонние утилиты, например XtraBackup:

```bash
xtrabackup --backup --target-dir=/root/backupdb/inc1 --incremental-basedir=/root/backupdb/full
```

3.2* Репликация будет давать преимущества по сравнению с резервным копирование в работе в высоконагруженных базах данных, на которых операции выполняются непрерывно или критически важны. Переход с мастера на слейв будет почти не заметен, чем восстановление из бэкапа.

---