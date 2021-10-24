variable "vpc" {
    type = string
    default = ""
}

variable "admin_security_group" {
    type = string
    default = ""
}

variable "db_security_group" {
    type = string
    default = ""
}

variable "db_name" {
    type = string
    default = ""
}

variable "db_instance_class" {
    type = string
    default = ""
}

variable "db_username" {
    type = string
    default = ""
}

variable "db_password" {
    type = string
    default = ""
}

variable "db_az" {
    type = string
    default = ""
}

variable "db_subnets" {
    type = list
    default = []
}

variable "db_subnet_group_name" {
    type = string
    default = ""
}

variable "db_engine" {
    type = string
    default = ""
}

variable "db_engine_version" {
    type = string
    default = ""
}

variable "primary_db_identifier" {
    type = string
    default = ""
}