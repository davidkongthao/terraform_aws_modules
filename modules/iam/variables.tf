variable "admins" {
    default = []
    type = list
}

variable "dev_s3_bucket" {
    default = ""
    type = string
}

variable "s3_service_accounts" {
    default = []
    type = list
}