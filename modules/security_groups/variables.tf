variable "vpc" {
    default = ""
    type = string
}

variable "security_group_rules" {
    default = []
    type = list
}