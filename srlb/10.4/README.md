# Домашнее задание к занятию "10.4 Резервное копирование" - Екимовский К.


---

### Задание 1.

* Полное копирование (Full backup) — производится копирование данных в полном объеме. Самый надежный способ копирования. В случае выхода из строя свежей копии данные можно восстановить из предыдущих копий. Эффективный и быстрый метод восстановления. Недостаток — требует носителей большого объема и длительного времени выполнения.

* Дифференциальное копирование (Differential backup) — копируются файлы, изменившиеся после последнего Full backup. Данные копируются «нарастающим итогом», так что последняя копия всегда будет содержать все изменения с момента последнего Full backup. Выполняется быстрее чем Full backup, при повреждении одной из копий не приводит к потере всех данных за последующий и предыдущий период (при наличии живого Full backup). Так или иначе требуется регулярный Full backup и бывает что последняя копия (при длительной работе) по размеру изменений приближается к Full backup.

* Инкрементное копирование (Incremental backup) — выполняется копирование только информации, измененной после выполнения предыдущего Incremental backup. Это самый быстрый метод резервирования и занимает меньше всего объема, но и самый ненадежный метод. В случае повреждения одной из копий все последующие становятся также не пригодными для восстановления. И соответственно при повреждении Full backup все становиться негодным. Восстановление данных занимает продолжительное время.

---

### Задание 2.

Скриншоты сервисов:
![alt text](https://github.com/konstantinekimovskii/srlb-11-homework/blob/main/10.4/img/2022Dec0250.png)

![alt text](https://github.com/konstantinekimovskii/srlb-11-homework/blob/main/10.4/img/2022Dec0252.png)

![alt text](https://github.com/konstantinekimovskii/srlb-11-homework/blob/main/10.4/img/2022Dec0252_1.png)


Конфиги: https://github.com/konstantinekimovskii/srlb-11-homework/tree/main/10.4/conf

---

### Задание 3.

# cat /etc/rsyncd.conf:

```
pid file = /var/run/rsyncd.pid
log file = /var/log/rsyncd.log
transfer logging = true
munge symlinks = yes
[data]
path = /var/lib
uid = root
read only = yes
list = yes
comment = Data backup Dir
auth users = backup
secrets file = /etc/rsyncd.scrt
```

# cat get_back.sh:

```
date
syst_dir=/backup/
srv_name=node1 #из тестовой конфигурации
srv_ip=192.168.0.73
srv_user=backup
srv_dir=data
echo "Start backup ${srv_name}"
mkdir -p ${syst_dir}${srv_name}/increment/
/usr/bin/rsync -avz --progress --delete --password-file=/etc/rsyncd.scrt ${srv_user}@${srv_ip}::${srv_dir} ${syst_dir}${srv_name}/current/ --backup --backup-dir=${syst_dir}${srv_name}/increment/`date +%Y-%m-%d`/
/usr/bin/find ${syst_dir}${srv_name}/increment/ -maxdepth 1 -type d -mtime +30 -exec rm -rf {} \;
date
echo "Finish backup ${srv_name}"
```

Скриншот:

![alt text](https://github.com/konstantinekimovskii/srlb-11-homework/blob/main/10.4/img/2022Dec0244.png)


---
