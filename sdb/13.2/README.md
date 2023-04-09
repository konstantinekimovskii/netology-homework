# Домашнее задание к занятию 13.2. «Защита хоста» - Екимовский К

---

## Задание 1

Команды:

```bash
apt install ecryptfs-utils
adduser cryptouser
sudo ecryptfs-migrate-home -u cryptouser
su - cryptouser
ecryptfs-unwrap-passphrase
```

Скрины:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/2023-01-04_12-51.png)

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/2023-01-04_12-52.png)

---

## Задание 2

* Примонтировал к vm дополнительный VBOX HARDDISK на 100MB:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/1.png)

* Создал новый раздел на диске, чтобы впоследствии использовать его.

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/2.png)

* Создал LUKS-раздел в новом разделе + открыл его:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/3.png)

* Указал ФС и точку монтирование LUKS-раздела:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.2/img/4.png)

---
