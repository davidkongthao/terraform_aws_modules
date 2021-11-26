output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.cdn_distribution.domain_name
}

output "cdn_public_key" {
    value = aws_cloudfront_public_key.cdn_public_key.id
}

output "cdn_oai_arn" {
    value = aws_cloudfront_origin_access_identity.cdn_oai.iam_arn
}