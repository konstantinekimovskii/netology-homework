# Домашнее задание к занятию "10.1. Keepalived/vrrp" - Екимовский К.

### Задание №1

Первая vm:

```
cat /etc/keepalived/keepalived.conf

vrrp_instance failover_test {
state MASTER
interface enp0s5
virtual_router_id 10
priority 100
advert_int 4
authentication {
auth_type AH
auth_pass 1111
}
unicast_peer {
192.168.13.234
}
    virtual_ipaddress {
    192.168.13.220 dev enp0s5 label enp0s5:vip
}
}
```

Вторая vm:

```
cat /etc/keepalived/keepalived.conf

vrrp_instance failover_test {
state BACKUP
interface enp0s5
virtual_router_id 10
priority 110
advert_int 4
authentication {
auth_type AH
auth_pass 1111
}
unicast_peer {
192.168.13.240
}
    virtual_ipaddress {
    192.168.13.220 dev enp0s5 label enp0s5:vip
}
}
```

Скрины:
![alt text](https://github.com/konstantinekimovskii/srlb-11-homework-10.1/blob/main/10.1/img/2022Dec1101.png)
![alt text](https://github.com/konstantinekimovskii/srlb-11-homework-10.1/blob/main/10.1/img/2022Dec1102.png)
