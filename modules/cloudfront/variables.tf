variable "s3_bucket_domain_name" {
    default = ""
    type = string
}

variable "s3_log_domain_name" {
    default = ""
    type = string
}

variable "s3_origin_id" {
    default = ""
    type = string
}

variable "cdn_alias" {
    default = ""
    type = string
}

variable "cdn_acm_arn" {
    default = ""
    type = string
}