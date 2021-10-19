provider "aws" {
    region                      = var.aws_default_region
    shared_credentials_file     = var.aws_credentials_location
    profile                     = var.aws_credentials_profile

    default_tags {
        tags = {
            Environment             = "${var.aws_environment_name}"
            Owner                   = "${var.aws_owner_contact}"
            Project                 = "${var.aws_project_name}"
            Contact                 = "${var.aws_owner_contact}"
        }
    }
}

terraform {
    required_version            = ">=0.15.0"
}