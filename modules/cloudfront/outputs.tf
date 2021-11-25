output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.dev_cdn_distribution.domain_name
}