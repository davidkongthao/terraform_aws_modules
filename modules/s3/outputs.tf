output "dev_s3_bucket" {
    value = aws_s3_bucket.dev_s3_bucket.arn
}

output "s3_bucket_domain_name" {
    value = aws_s3_bucket.dev_s3_bucket.bucket_regional_domain_name
}

output "s3_logs_bucket_domain_name" {
    value = aws_s3_bucket.log_s3_bucket.bucket_domain_name
}