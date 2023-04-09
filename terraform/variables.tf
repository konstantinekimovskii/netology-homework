variable "image_id" {
    type = string
    default = "fd8gnpl76tcrdv0qsfko"
}
variable "image_id_bastion" {
    type = string
    default = "fd83a20ua7cu594osbio"
}
variable "username" {
    type = string
    default = "ubuntu"
}
variable "password" {
    type = string
    default = "qwerty"
}
variable "public_key_path" {
    type = string
    default = "~/.ssh/yandex-cloud.pub"
}
