# Домашнее задание к занятию 12.09. «Базы данных в облаке» - Екимовский К

---

## Задание 1

Скриншоты:

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.9/img/2023Jan0927.png)

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.9/img/2023Jan0925.png)

![alt text](https://github.com/konstantinekimovskii/sdb-11-homework/blob/main/12.9/img/2023Jan0926.png)

---

## Задание 2

Код terraform:

```javascript
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  token     = "###"
  cloud_id  = "###"
  folder_id = "###"
}

resource "yandex_mdb_postgresql_cluster" "test" {
  name                = "test"
  environment         = "PRESTABLE"
  network_id          = "yandex_vpc_network.testdb2.id"

  config {
    version = 14
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 10
    }
  }

  host {
    assign_public_ip = true
    zone      = "ru-central1-a"
    subnet_id = "yandex_vpc_subnet.mysubnet-a.id"
  }

  host {
    assign_public_ip = true
    zone      = "ru-central1-b"
    subnet_id = "yandex_vpc_subnet.mysubnet-b.id"
  }
}

resource "yandex_mdb_postgresql_database" "test" {
  cluster_id = "yandex_mdb_postgresql_cluster.test.id"
  name       = "dbnetologysql"
  owner      = yandex_mdb_postgresql_user.test.id
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
  extension {
    name = "uuid-ossp"
  }
  extension {
    name = "xml2"
  }
}

resource "yandex_mdb_postgresql_user" "test" {
  cluster_id = "yandex_mdb_postgresql_cluster.test.id"
  name       = "admindb"
  password   = "TrueMass!"
}

resource "yandex_vpc_network" "testdb2" {
  name = "testdb2"
}

resource "yandex_vpc_subnet" "mysubnet-a" {
  name           = "mysubnet-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.testdb2.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}

resource "yandex_vpc_subnet" "mysubnet-b" {
  name           = "mysubnet-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.testdb2.id
  v4_cidr_blocks = ["10.6.0.0/24"]
}
```
