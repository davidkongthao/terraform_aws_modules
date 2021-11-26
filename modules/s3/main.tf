resource "aws_s3_bucket" "app_s3_bucket" {
    bucket                      = var.s3_bucket_name
    force_destroy               = true
}

resource "aws_s3_bucket_public_access_block" "app_s3_bucket_acl" {
    bucket                      = aws_s3_bucket.app_s3_bucket.id
    block_public_acls           = true
    block_public_policy         = true
    ignore_public_acls          = true
    restrict_public_buckets     = true
}

resource "aws_s3_bucket_policy" "app_s3_bucket_policy" {
    bucket                      = aws_s3_bucket.app_s3_bucket.id

    policy                      = jsonencode({
        Version     = "2012-10-17"
        Id          = "DevS3BucketPolicy"
        Statement   = [
            {
                Sid         = "Allows CloudFront OAI to retrieve objects"
                Effect      = "Allow"
                Principal   = {"AWS":"${var.cdn_oai_arn}"}
                Action      = [
                    "s3:GetObject",
                ]
                Resource    = [
                    "${aws_s3_bucket.app_s3_bucket.arn}",
                    "${aws_s3_bucket.app_s3_bucket.arn}/*"
                ]
            }
        ]
    })
}

resource "aws_s3_bucket" "log_s3_bucket" {
    bucket                      = var.s3_log_bucket_name

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id               = var.kms_key
                sse_algorithm                   = "aws:kms"
            }
        }
    }
}

resource "aws_s3_bucket_public_access_block" "log_s3_bucket_acl" {
    bucket                      = aws_s3_bucket.log_s3_bucket.id
    block_public_acls           = true
    block_public_policy         = true
    ignore_public_acls          = true
    restrict_public_buckets     = true
}