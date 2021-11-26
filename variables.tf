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

variable "aws_environment_name" {
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

variable "email_zone_name" {
    default = ""
    type = string
}

variable "primary_dns_name" {
    default = ""
    type = string
}

variable "mx_dns_records" {
    default = []
    type = list
}

variable "sendgrid_dns_records"{
    default = {}
    type = map
}

variable "rds_username" {
    default = ""
    type = string
}

variable "rds_password" {
    default = ""
    type = string
}

variable "rds_db_name" {
    default = ""
    type = string
}

variable "rds_instance_class" {
    default = ""
    type = string
}

variable "rds_db_az" {
    default = ""
    type = string
}

variable "rds_engine" {
    default = ""
    type = string
}

variable "rds_engine_version" {
    default = ""
    type = string
}

variable "primary_rds_identifier" {
    default = ""
    type = string
}

variable "s3_bucket_name" {
    default = ""
    type = string
}

variable "s3_log_bucket_name" {
    default = ""
    type = string
}

variable "s3_service_account" {
    default = ""
    type = string
}

variable "s3_origin_id" {
    default = ""
    type = string
}

variable "cloudfront_cdn_aliases"{
    default = []
    type = list
}

variable "cdn_alias" {
    default = ""
    type = string
}