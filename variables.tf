variable "aws_credentials_profile" {
    default = ""
    type = string
}

variable "aws_credentials_location" {
    default = ""
    type = string
}

variable "aws_default_region" {
    default = ""
    type = string
}

variable "aws_owner_contact" {
    default = ""
    type = string
}

variable "aws_project_name" {
    default = ""
    type = string
}

variable "ami" {
    default = ""
    type = string
}

variable "instance_type" {
    default = ""
    type = string
}

variable "vpc_cidr_block" {
    default = ""
    type = string
}

variable "vpc_instance_tenancy" {
    default = ""
    type = string
}

variable "enable_dns_support" {
    default = true
    type = bool
}

variable "enable_dns_hostnames" {
    default = true
    type = bool
}

variable "dmz_subnet_cidr_a" {
    default = ""
    type = string
}

variable "dmz_subnet_cidr_b" {
    default = ""
    type = string
}

variable "dmz_subnet_cidr_c" {
    default = ""
    type = string
}

variable "app_subnet_cidr_a" {
    default = ""
    type = string
}

variable "app_subnet_cidr_b" {
    default = ""
    type = string
}

variable "app_subnet_cidr_c" {
    default = ""
    type = string
}

variable "db_subnet_cidr_a" {
    default = ""
    type = string
}

variable "db_subnet_cidr_b" {
    default = ""
    type = string
}

variable "db_subnet_cidr_c" {
    default = ""
    type = string
}

variable "security_group_rules" {
    default = []
    type = list
}

variable "admin_users" {
    default = []
    type = list
}