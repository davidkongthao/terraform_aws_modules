variable "cidr_block" {}

variable "instance_tenancy" {}

variable "enable_dns_support" {}

variable "enable_dns_hostnames" {}

variable "dmz_subnet_cidrs" {
    default = []
    type = list
}

variable "app_subnet_cidrs" {
    default = []
    type = list
}

variable "db_subnet_cidrs" {
    default = []
    type = list
}