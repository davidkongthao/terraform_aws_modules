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

provider "aws" {
    region                      = "us-east-1"
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

    alias                       = "useastone"
}

terraform {
    required_version            = ">=1.0.0"
    required_providers  {
        aws = {
            source              = "hashicorp/aws"
            version             = "~> 3.63.0"
        }
    }
}