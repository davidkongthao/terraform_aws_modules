resource "aws_s3_bucket" "dev_s3_bucket" {
    bucket = var.s3_bucket_name
    acl = "private"

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id               = var.kms_key
                sse_algorithm                   = "aws:kms"
            }
        }
    }
}

resource "aws_s3_bucket" "log_s3_bucket" {
    bucket = var.s3_log_bucket_name
    acl = "private"

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id               = var.kms_key
                sse_algorithm                   = "aws:kms"
            }
        }
    }
}