# Домашнее задание к занятию 13.3. «Защита сети» - Екимовский К

---

## Задание 1

Команды:

**nmap -sT 192.168.0.136** лог Suricata:

```text
01/05/2023-12:33:24.032829  [**] [1:2001219:20] ET SCAN Potential SSH Scan [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:47922 -> 192.168.0.136:22
01/05/2023-12:38:31.016285  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:39988 -> 192.168.0.136:3306
01/05/2023-12:38:32.025876  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:39988 -> 192.168.0.136:3306
01/05/2023-12:38:32.317104  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:39992 -> 192.168.0.136:3306
01/05/2023-12:38:33.334362  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:39992 -> 192.168.0.136:3306
01/05/2023-12:38:35.285478  [**] [1:2001219:20] ET SCAN Potential SSH Scan [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:40340 -> 192.168.0.136:22
01/05/2023-12:38:37.821182  [**] [1:2002911:6] ET SCAN Potential VNC Scan 5900-5920 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:40490 -> 192.168.0.136:5902
01/05/2023-12:38:49.340225  [**] [1:2002910:6] ET SCAN Potential VNC Scan 5800-5820 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:45060 -> 192.168.0.136:5802
01/05/2023-12:39:06.076631  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:46974 -> 192.168.0.136:1433
01/05/2023-12:39:07.092449  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:46974 -> 192.168.0.136:1433
01/05/2023-12:39:32.446928  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:45032 -> 192.168.0.136:5432
01/05/2023-12:39:33.460222  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:45032 -> 192.168.0.136:5432
01/05/2023-12:39:34.168347  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:42894 -> 192.168.0.136:1521
01/05/2023-12:39:35.179225  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:45048 -> 192.168.0.136:5432
01/05/2023-12:39:35.189522  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:42894 -> 192.168.0.136:1521
01/05/2023-12:39:36.184549  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:45048 -> 192.168.0.136:5432
01/05/2023-12:39:36.815237  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:42908 -> 192.168.0.136:1521
01/05/2023-12:39:37.848464  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:42908 -> 192.168.0.136:1521
```

**nmap -sS 192.168.0.136** лог Suricata:

```text
01/05/2023-12:47:48.943184  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:3306
01/05/2023-12:47:50.200641  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49012 -> 192.168.0.136:3306
01/05/2023-12:47:54.000377  [**] [1:2002911:6] ET SCAN Potential VNC Scan 5900-5920 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:5906
01/05/2023-12:47:54.009900  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:1521
01/05/2023-12:47:54.166709  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49012 -> 192.168.0.136:1521
01/05/2023-12:47:54.325353  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:1433
01/05/2023-12:47:54.483707  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49012 -> 192.168.0.136:1433
01/05/2023-12:47:55.826860  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:5432
01/05/2023-12:47:55.826995  [**] [1:2002910:6] ET SCAN Potential VNC Scan 5800-5820 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:49010 -> 192.168.0.136:5811
01/05/2023-12:47:55.969071  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:49012 -> 192.168.0.136:5432
```

**nmap -sV 192.168.0.136** лог Suricata:

```text
01/05/2023-12:48:55.596817  [**] [1:2010937:3] ET SCAN Suspicious inbound to mySQL port 3306 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:3306
01/05/2023-12:48:58.358863  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:5432
01/05/2023-12:48:58.622627  [**] [1:2010939:3] ET SCAN Suspicious inbound to PostgreSQL port 5432 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55816 -> 192.168.0.136:5432
01/05/2023-12:48:59.882491  [**] [1:2002911:6] ET SCAN Potential VNC Scan 5900-5920 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:5904
01/05/2023-12:49:00.887673  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:1433
01/05/2023-12:49:01.163233  [**] [1:2010935:3] ET SCAN Suspicious inbound to MSSQL port 1433 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55816 -> 192.168.0.136:1433
01/05/2023-12:49:01.964577  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:1521
01/05/2023-12:49:02.079493  [**] [1:2002910:6] ET SCAN Potential VNC Scan 5800-5820 [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:55814 -> 192.168.0.136:5801
01/05/2023-12:49:02.212740  [**] [1:2010936:3] ET SCAN Suspicious inbound to Oracle SQL port 1521 [**] [Classification: Potentially Bad Traffic] [Priority: 2] {TCP} 192.168.0.148:55816 -> 192.168.0.136:1521
```

В логах Suricata данные сканирования через nmap отмечены как подозрительные [Classification: Potentially Bad Traffic].
В логах fail2ban инфы нет, настроены правила только на службу ssh.

Скриншот:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.3/img/1.png)

---

## Задание 2

Выполнил попытку подбора паролей к службе ssh: **hydra -L users.txt -P pass.txt 192.168.0.136 ssh**
В логах fail2ban:

```text
2023-01-05 13:03:22,439 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,459 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,460 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,461 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,463 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,466 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,467 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,471 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,472 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,476 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,477 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,483 fail2ban.filter         [2986]: INFO    [sshd] Found 192.168.0.148 - 2023-01-05 13:03:22
2023-01-05 13:03:22,624 fail2ban.actions        [2986]: NOTICE  [sshd] Ban 192.168.0.148
```

Лог Suricata:

```text
01/05/2023-13:03:20.650562  [**] [1:2001219:20] ET SCAN Potential SSH Scan [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:51850 -> 192.168.0.136:22
01/05/2023-13:05:20.614054  [**] [1:2001219:20] ET SCAN Potential SSH Scan [**] [Classification: Attempted Information Leak] [Priority: 2] {TCP} 192.168.0.148:47970 -> 192.168.0.136:22
```

Так как служба fail2ban настроена для ssh, то адрес сканирующей машины был отправлен в блокировку:

```bash
[root@localhost ~]# fail2ban-client status sshd
Status for the jail: sshd
|- Filter
|  |- Currently failed: 1
|  |- Total failed:     583
|  `- Journal matches:  _SYSTEMD_UNIT=sshd.service + _COMM=sshd
`- Actions
   |- Currently banned: 1
   |- Total banned:     2
   `- Banned IP list:   192.168.0.148
```

В Suricata отмечено ssh сканирование.

Скриншот работы hydra:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/13.3/img/2.png)

---
