variable "s3_bucket_name" {
    default = ""
    type = string
}

variable "s3_log_bucket_name" {
    default = ""
    type = string
}

variable "kms_key" {
    default = ""
    type = string
}

variable "s3_user" {
    default = ""
    type = string
}

variable "cdn_oai_arn" {
    default = ""
    type = string
}