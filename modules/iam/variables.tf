variable "admins" {
    default = []
    type = list
}

variable "app_s3_bucket" {
    default = ""
    type = string
}

variable "s3_service_account" {
    default = ""
    type = string
}