# Домашнее задание к занятию 13.1. «Уязвимости и атаки на информационные системы» - Екимовский К

---

## Задание 1

Сетевые службы:

```bash
PORT     STATE SERVICE     VERSION
21/tcp   open  ftp         vsftpd 2.3.4
22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
23/tcp   open  telnet      Linux telnetd
25/tcp   open  smtp        Postfix smtpd
53/tcp   open  domain      ISC BIND 9.4.2
80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
111/tcp  open  rpcbind     2 (RPC #100000)
139/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp  open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
512/tcp  open  exec        netkit-rsh rexecd
513/tcp  open  login
514/tcp  open  tcpwrapped
1099/tcp open  java-rmi    GNU Classpath grmiregistry
1524/tcp open  bindshell   Metasploitable root shell
2049/tcp open  nfs         2-4 (RPC #100003)
2121/tcp open  ftp         ProFTPD 1.3.1
3306/tcp open  mysql       MySQL 5.0.51a-3ubuntu5
5432/tcp open  postgresql  PostgreSQL DB 8.3.0 - 8.3.7
5900/tcp open  vnc         VNC (protocol 3.3)
6000/tcp open  X11         (access denied)
6667/tcp open  irc         UnrealIRCd
8009/tcp open  ajp13       Apache Jserv (Protocol v1.3)
8180/tcp open  http        Apache Tomcat/Coyote JSP engine 1.1

###

# MAC Address: 08:00:27:D8:97:F7 (Oracle VirtualBox virtual NIC)
# Device type: general purpose
# Running: Linux 2.6.X
# OS CPE: cpe:/o:linux:linux_kernel:2.6
# OS details: Linux 2.6.9 - 2.6.33
```

Уязвимости:

* 21/tcp open ftp vsftpd 2.3.4:
  1. <https://www.exploit-db.com/exploits/49757>
  2. <https://www.exploit-db.com/exploits/17491>
* 22/tcp open ssh OpenSSH 4.7p1 Debian 8ubuntu1 - <https://amolblog.com/port-22-tcp-open-ssh-openssh-4-7p1-debian-8ubuntu1-protocol-2-0-exploit/>
* 3306/tcp open mysql MySQL 5.0.51a-3ubuntu5:
  1. <https://www.exploit-db.com/exploits/23077>
  2. <https://amolblog.com/3306-tcp-open-mysql-mysql-5-0-51a-3ubuntu5-exploit/>

---

Если подходить к вопросу уязвимостей более серьезно, то:

```bash
nmap -A --script vulners.nse 192.168.0.73

22/tcp   open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
| vulners: 
|   cpe:/a:openbsd:openssh:4.7p1: 
|       SECURITYVULNS:VULN:8166 7.5     https://vulners.com/securityvulns/SECURITYVULNS:VULN:8166
|       CVE-2010-4478   7.5     https://vulners.com/cve/CVE-2010-4478
|       CVE-2008-1657   6.5     https://vulners.com/cve/CVE-2008-1657
|       SSV:60656       5.0     https://vulners.com/seebug/SSV:60656    *EXPLOIT*
|       CVE-2010-5107   5.0     https://vulners.com/cve/CVE-2010-5107
|       CVE-2012-0814   3.5     https://vulners.com/cve/CVE-2012-0814
|       CVE-2011-5000   3.5     https://vulners.com/cve/CVE-2011-5000
|       CVE-2008-5161   2.6     https://vulners.com/cve/CVE-2008-5161
|       CVE-2011-4327   2.1     https://vulners.com/cve/CVE-2011-4327
|       CVE-2008-3259   1.2     https://vulners.com/cve/CVE-2008-3259
|_      SECURITYVULNS:VULN:9455 0.0     https://vulners.com/securityvulns/SECURITYVULNS:VULN:9455

53/tcp   open  domain      ISC BIND 9.4.2
| vulners: 
|   cpe:/a:isc:bind:9.4.2: 
|       SSV:60184       8.5     https://vulners.com/seebug/SSV:60184    *EXPLOIT*
|       CVE-2012-1667   8.5     https://vulners.com/cve/CVE-2012-1667
|       SSV:60292       7.8     https://vulners.com/seebug/SSV:60292    *EXPLOIT*
|       CVE-2014-8500   7.8     https://vulners.com/cve/CVE-2014-8500
|       CVE-2012-5166   7.8     https://vulners.com/cve/CVE-2012-5166
|       CVE-2012-4244   7.8     https://vulners.com/cve/CVE-2012-4244
|       CVE-2012-3817   7.8     https://vulners.com/cve/CVE-2012-3817
|       CVE-2008-4163   7.8     https://vulners.com/cve/CVE-2008-4163
|       CVE-2010-0382   7.6     https://vulners.com/cve/CVE-2010-0382
|       EXPLOITPACK:D6DDF5E24DE171DAAD71FD95FC1B67F2    7.2     https://vulners.com/exploitpack/EXPLOITPACK:D6DDF5E24DE171DAAD71FD95FC1B67F2   *EXPLOIT*
|       EDB-ID:42121    7.2     https://vulners.com/exploitdb/EDB-ID:42121      *EXPLOIT*
|       CVE-2017-3141   7.2     https://vulners.com/cve/CVE-2017-3141
|       CVE-2015-8461   7.1     https://vulners.com/cve/CVE-2015-8461
|       CVE-2021-25216  6.8     https://vulners.com/cve/CVE-2021-25216
|       CVE-2015-8704   6.8     https://vulners.com/cve/CVE-2015-8704
|       CVE-2009-0025   6.8     https://vulners.com/cve/CVE-2009-0025
|       CVE-2015-8705   6.6     https://vulners.com/cve/CVE-2015-8705
|       CVE-2010-3614   6.4     https://vulners.com/cve/CVE-2010-3614
|       SSV:4636        5.8     https://vulners.com/seebug/SSV:4636     *EXPLOIT*
|       SSV:30099       5.0     https://vulners.com/seebug/SSV:30099    *EXPLOIT*
|       SSV:20595       5.0     https://vulners.com/seebug/SSV:20595    *EXPLOIT*
|       PACKETSTORM:157836      5.0     https://vulners.com/packetstorm/PACKETSTORM:157836      *EXPLOIT*
|       FBC03933-7A65-52F3-83F4-4B2253A490B6    5.0     https://vulners.com/githubexploit/FBC03933-7A65-52F3-83F4-4B2253A490B6  *EXPLOIT*
|       CVE-2021-25219  5.0     https://vulners.com/cve/CVE-2021-25219
|       CVE-2021-25215  5.0     https://vulners.com/cve/CVE-2021-25215
|       CVE-2020-8616   5.0     https://vulners.com/cve/CVE-2020-8616
|       CVE-2017-3145   5.0     https://vulners.com/cve/CVE-2017-3145
|       CVE-2016-9444   5.0     https://vulners.com/cve/CVE-2016-9444
|       CVE-2016-9131   5.0     https://vulners.com/cve/CVE-2016-9131
|       CVE-2016-8864   5.0     https://vulners.com/cve/CVE-2016-8864
|       CVE-2016-2848   5.0     https://vulners.com/cve/CVE-2016-2848
|       CVE-2016-1286   5.0     https://vulners.com/cve/CVE-2016-1286
|       CVE-2015-8000   5.0     https://vulners.com/cve/CVE-2015-8000
|       CVE-2012-1033   5.0     https://vulners.com/cve/CVE-2012-1033
|       CVE-2011-4313   5.0     https://vulners.com/cve/CVE-2011-4313
|       CVE-2011-1910   5.0     https://vulners.com/cve/CVE-2011-1910
|       CVE-2009-0265   5.0     https://vulners.com/cve/CVE-2009-0265
|       SSV:11919       4.3     https://vulners.com/seebug/SSV:11919    *EXPLOIT*
|       CVE-2020-8617   4.3     https://vulners.com/cve/CVE-2020-8617
|       CVE-2017-3143   4.3     https://vulners.com/cve/CVE-2017-3143
|       CVE-2017-3142   4.3     https://vulners.com/cve/CVE-2017-3142
|       CVE-2016-2775   4.3     https://vulners.com/cve/CVE-2016-2775
|       CVE-2016-1285   4.3     https://vulners.com/cve/CVE-2016-1285
|       CVE-2010-0097   4.3     https://vulners.com/cve/CVE-2010-0097
|       CVE-2009-0696   4.3     https://vulners.com/cve/CVE-2009-0696
|       1337DAY-ID-34485        4.3     https://vulners.com/zdt/1337DAY-ID-34485        *EXPLOIT*
|       CVE-2020-8622   4.0     https://vulners.com/cve/CVE-2020-8622
|       CVE-2016-6170   4.0     https://vulners.com/cve/CVE-2016-6170
|       CVE-2010-0290   4.0     https://vulners.com/cve/CVE-2010-0290
|       SSV:14986       2.6     https://vulners.com/seebug/SSV:14986    *EXPLOIT*
|       CVE-2009-4022   2.6     https://vulners.com/cve/CVE-2009-4022
|       PACKETSTORM:142800      0.0     https://vulners.com/packetstorm/PACKETSTORM:142800      *EXPLOIT*
|       CVE-2022-2795   0.0     https://vulners.com/cve/CVE-2022-2795
|_      1337DAY-ID-27896        0.0     https://vulners.com/zdt/1337DAY-ID-27896        *EXPLOIT*


80/tcp   open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
| vulners: 
|   cpe:/a:apache:http_server:2.2.8: 
|       SSV:72403       7.8     https://vulners.com/seebug/SSV:72403    *EXPLOIT*
|       SSV:26043       7.8     https://vulners.com/seebug/SSV:26043    *EXPLOIT*
|       SSV:20899       7.8     https://vulners.com/seebug/SSV:20899    *EXPLOIT*
|       PACKETSTORM:126851      7.8     https://vulners.com/packetstorm/PACKETSTORM:126851      *EXPLOIT*
|       PACKETSTORM:123527      7.8     https://vulners.com/packetstorm/PACKETSTORM:123527      *EXPLOIT*
|       PACKETSTORM:122962      7.8     https://vulners.com/packetstorm/PACKETSTORM:122962      *EXPLOIT*
|       EXPLOITPACK:186B5FCF5C57B52642E62C06BABC6F83    7.8     https://vulners.com/exploitpack/EXPLOITPACK:186B5FCF5C57B52642E62C06BABC6F83   *EXPLOIT*
|       EDB-ID:18221    7.8     https://vulners.com/exploitdb/EDB-ID:18221      *EXPLOIT*
|       CVE-2011-3192   7.8     https://vulners.com/cve/CVE-2011-3192
|       1337DAY-ID-21170        7.8     https://vulners.com/zdt/1337DAY-ID-21170        *EXPLOIT*
|       SSV:12673       7.5     https://vulners.com/seebug/SSV:12673    *EXPLOIT*
|       SSV:12626       7.5     https://vulners.com/seebug/SSV:12626    *EXPLOIT*
|       ECC3E825-EE29-59D3-BE28-1B30DB15940E    7.5     https://vulners.com/githubexploit/ECC3E825-EE29-59D3-BE28-1B30DB15940E  *EXPLOIT*
|       CVE-2017-7679   7.5     https://vulners.com/cve/CVE-2017-7679
|       CVE-2017-3167   7.5     https://vulners.com/cve/CVE-2017-3167
|       SSV:11802       7.1     https://vulners.com/seebug/SSV:11802    *EXPLOIT*
|       SSV:11762       7.1     https://vulners.com/seebug/SSV:11762    *EXPLOIT*
|       CVE-2009-1891   7.1     https://vulners.com/cve/CVE-2009-1891
|       CVE-2009-1890   7.1     https://vulners.com/cve/CVE-2009-1890
|       SSV:60427       6.9     https://vulners.com/seebug/SSV:60427    *EXPLOIT*
|       SSV:60386       6.9     https://vulners.com/seebug/SSV:60386    *EXPLOIT*
|       SSV:60069       6.9     https://vulners.com/seebug/SSV:60069    *EXPLOIT*
|       CVE-2012-0883   6.9     https://vulners.com/cve/CVE-2012-0883
|       PACKETSTORM:127546      6.8     https://vulners.com/packetstorm/PACKETSTORM:127546      *EXPLOIT*
|       CVE-2016-5387   6.8     https://vulners.com/cve/CVE-2016-5387
|       CVE-2014-0226   6.8     https://vulners.com/cve/CVE-2014-0226
|       1337DAY-ID-22451        6.8     https://vulners.com/zdt/1337DAY-ID-22451        *EXPLOIT*
|       CVE-2017-9788   6.4     https://vulners.com/cve/CVE-2017-9788
|       VULNERLAB:967   5.8     https://vulners.com/vulnerlab/VULNERLAB:967     *EXPLOIT*
|       VULNERABLE:967  5.8     https://vulners.com/vulnerlab/VULNERABLE:967    *EXPLOIT*
|       SSV:67231       5.8     https://vulners.com/seebug/SSV:67231    *EXPLOIT*
|       SSV:18637       5.8     https://vulners.com/seebug/SSV:18637    *EXPLOIT*
|       SSV:15088       5.8     https://vulners.com/seebug/SSV:15088    *EXPLOIT*
|       SSV:12600       5.8     https://vulners.com/seebug/SSV:12600    *EXPLOIT*
|       PACKETSTORM:84112       5.8     https://vulners.com/packetstorm/PACKETSTORM:84112       *EXPLOIT*
|       EXPLOITPACK:8B4E7E8DAE5A13C8250C6C33307CD66C    5.8     https://vulners.com/exploitpack/EXPLOITPACK:8B4E7E8DAE5A13C8250C6C33307CD66C   *EXPLOIT*
|       EDB-ID:10579    5.8     https://vulners.com/exploitdb/EDB-ID:10579      *EXPLOIT*
|       CVE-2009-3555   5.8     https://vulners.com/cve/CVE-2009-3555
|       SSV:60788       5.1     https://vulners.com/seebug/SSV:60788    *EXPLOIT*
|       CVE-2013-1862   5.1     https://vulners.com/cve/CVE-2013-1862
|       SSV:96537       5.0     https://vulners.com/seebug/SSV:96537    *EXPLOIT*
|       SSV:62058       5.0     https://vulners.com/seebug/SSV:62058    *EXPLOIT*
|       SSV:61874       5.0     https://vulners.com/seebug/SSV:61874    *EXPLOIT*
|       SSV:20993       5.0     https://vulners.com/seebug/SSV:20993    *EXPLOIT*
|       SSV:20979       5.0     https://vulners.com/seebug/SSV:20979    *EXPLOIT*
|       SSV:20969       5.0     https://vulners.com/seebug/SSV:20969    *EXPLOIT*
|       SSV:19592       5.0     https://vulners.com/seebug/SSV:19592    *EXPLOIT*
|       PACKETSTORM:105672      5.0     https://vulners.com/packetstorm/PACKETSTORM:105672      *EXPLOIT*
|       PACKETSTORM:105591      5.0     https://vulners.com/packetstorm/PACKETSTORM:105591      *EXPLOIT*
|       EXPLOITPACK:C8C256BE0BFF5FE1C0405CB0AA9C075D    5.0     https://vulners.com/exploitpack/EXPLOITPACK:C8C256BE0BFF5FE1C0405CB0AA9C075D   *EXPLOIT*
|       EXPLOITPACK:460143F0ACAE117DD79BD75EDFDA154B    5.0     https://vulners.com/exploitpack/EXPLOITPACK:460143F0ACAE117DD79BD75EDFDA154B   *EXPLOIT*
|       EDB-ID:42745    5.0     https://vulners.com/exploitdb/EDB-ID:42745      *EXPLOIT*
|       EDB-ID:17969    5.0     https://vulners.com/exploitdb/EDB-ID:17969      *EXPLOIT*
|       CVE-2017-9798   5.0     https://vulners.com/cve/CVE-2017-9798
|       CVE-2016-8743   5.0     https://vulners.com/cve/CVE-2016-8743
|       CVE-2014-0231   5.0     https://vulners.com/cve/CVE-2014-0231
|       CVE-2014-0098   5.0     https://vulners.com/cve/CVE-2014-0098
|       CVE-2013-6438   5.0     https://vulners.com/cve/CVE-2013-6438
|       CVE-2013-5704   5.0     https://vulners.com/cve/CVE-2013-5704
|       CVE-2011-3368   5.0     https://vulners.com/cve/CVE-2011-3368
|       CVE-2010-1452   5.0     https://vulners.com/cve/CVE-2010-1452
|       CVE-2010-0408   5.0     https://vulners.com/cve/CVE-2010-0408
|       CVE-2009-3095   5.0     https://vulners.com/cve/CVE-2009-3095
|       CVE-2009-2699   5.0     https://vulners.com/cve/CVE-2009-2699
|       CVE-2008-2364   5.0     https://vulners.com/cve/CVE-2008-2364
|       CVE-2007-6750   5.0     https://vulners.com/cve/CVE-2007-6750
|       1337DAY-ID-28573        5.0     https://vulners.com/zdt/1337DAY-ID-28573        *EXPLOIT*
|       SSV:11668       4.9     https://vulners.com/seebug/SSV:11668    *EXPLOIT*
|       SSV:11501       4.9     https://vulners.com/seebug/SSV:11501    *EXPLOIT*
|       CVE-2009-1195   4.9     https://vulners.com/cve/CVE-2009-1195
|       SSV:30024       4.6     https://vulners.com/seebug/SSV:30024    *EXPLOIT*
|       CVE-2012-0031   4.6     https://vulners.com/cve/CVE-2012-0031
|       1337DAY-ID-27465        4.6     https://vulners.com/zdt/1337DAY-ID-27465        *EXPLOIT*
|       SSV:23169       4.4     https://vulners.com/seebug/SSV:23169    *EXPLOIT*
|       CVE-2011-3607   4.4     https://vulners.com/cve/CVE-2011-3607
|       1337DAY-ID-27473        4.4     https://vulners.com/zdt/1337DAY-ID-27473        *EXPLOIT*
|       SSV:60905       4.3     https://vulners.com/seebug/SSV:60905    *EXPLOIT*
|       SSV:60657       4.3     https://vulners.com/seebug/SSV:60657    *EXPLOIT*
|       SSV:60653       4.3     https://vulners.com/seebug/SSV:60653    *EXPLOIT*
|       SSV:60345       4.3     https://vulners.com/seebug/SSV:60345    *EXPLOIT*
|       SSV:4786        4.3     https://vulners.com/seebug/SSV:4786     *EXPLOIT*
|       SSV:3804        4.3     https://vulners.com/seebug/SSV:3804     *EXPLOIT*
|       SSV:30094       4.3     https://vulners.com/seebug/SSV:30094    *EXPLOIT*
|       SSV:30056       4.3     https://vulners.com/seebug/SSV:30056    *EXPLOIT*
|       SSV:24250       4.3     https://vulners.com/seebug/SSV:24250    *EXPLOIT*
|       SSV:20555       4.3     https://vulners.com/seebug/SSV:20555    *EXPLOIT*
|       SSV:19320       4.3     https://vulners.com/seebug/SSV:19320    *EXPLOIT*
|       PACKETSTORM:109284      4.3     https://vulners.com/packetstorm/PACKETSTORM:109284      *EXPLOIT*
|       EXPLOITPACK:FDCB3D93694E48CD5EE27CE55D6801DE    4.3     https://vulners.com/exploitpack/EXPLOITPACK:FDCB3D93694E48CD5EE27CE55D6801DE   *EXPLOIT*
|       CVE-2016-4975   4.3     https://vulners.com/cve/CVE-2016-4975
|       CVE-2014-0118   4.3     https://vulners.com/cve/CVE-2014-0118
|       CVE-2013-1896   4.3     https://vulners.com/cve/CVE-2013-1896
|       CVE-2012-4558   4.3     https://vulners.com/cve/CVE-2012-4558
|       CVE-2012-3499   4.3     https://vulners.com/cve/CVE-2012-3499
|       CVE-2012-0053   4.3     https://vulners.com/cve/CVE-2012-0053
|       CVE-2011-4317   4.3     https://vulners.com/cve/CVE-2011-4317
|       CVE-2011-3639   4.3     https://vulners.com/cve/CVE-2011-3639
|       CVE-2011-0419   4.3     https://vulners.com/cve/CVE-2011-0419
|       CVE-2010-0434   4.3     https://vulners.com/cve/CVE-2010-0434
|       CVE-2008-2939   4.3     https://vulners.com/cve/CVE-2008-2939
|       CVE-2008-0455   4.3     https://vulners.com/cve/CVE-2008-0455
|       CVE-2008-0005   4.3     https://vulners.com/cve/CVE-2008-0005
|       SSV:12628       2.6     https://vulners.com/seebug/SSV:12628    *EXPLOIT*
|       CVE-2012-2687   2.6     https://vulners.com/cve/CVE-2012-2687
|       CVE-2009-3094   2.6     https://vulners.com/cve/CVE-2009-3094
|       CVE-2008-0456   2.6     https://vulners.com/cve/CVE-2008-0456
|       SSV:60250       1.2     https://vulners.com/seebug/SSV:60250    *EXPLOIT*
|_      CVE-2011-4415   1.2     https://vulners.com/cve/CVE-2011-4415

...

```

---

## Задание 2

* SYN - соединение не устанавливается до конца. На исследуемый порт посылается сообщение SYN, затем идет ожидание ответа, на основании которого определяется статус порта. Ответы SYN/ACK говорят, что порт прослушивается (открыт), а ответ RST говорит, что не прослушивается.

* FIN + Xmas - производится отправка пакетов с отключенными флагами в заголовке TCP. При FIN-сканировании устанавливается бит TCP FIN, а в Xmas-сканировании устанавливаются флаги FIN, PSH и URG. Методы основаны на особенности спецификации RFC 793, согласно которой при закрытом порте входящий сегмент, не содержащий RST, повлечет за собой отправку RST в ответ. Когда порт открыт, ответа не будет. Ошибка достижимости ICMP означает, что порт фильтруется.

* UDP - для определения статуса порта посылается пустой UDP-заголовок, и если в ответ приходит ошибка достижимости ICMP Destination Unreachable с кодом Destination port unreachable, это значит, что порт закрыт; другие ошибки достижимости ICMP (Destination host unreachable, Destination protocol unreachable, Network administratively prohibited, Host administratively prohibited, Communication administratively prohibited) означают, что порт фильтруется. Если порт отвечает UDP-пакетом, предполагается, что он открыт.

---
