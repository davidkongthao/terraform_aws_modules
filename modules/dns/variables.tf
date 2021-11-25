variable "primary_dns_name" {
    default = ""
    type = string
}

variable "mx_dns_records" {
    default = []
    type = list
}

variable "sendgrid_dns_records" {
    default = {}
    type = map
}

variable "email_zone_name" {
    default = ""
    type = string
}

variable "cdn_dns_name" {
    default = ""
    type = string
}

variable "cdn_cname_name" {
    default = ""
    type = string
}