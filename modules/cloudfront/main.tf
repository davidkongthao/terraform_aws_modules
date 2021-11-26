resource "aws_cloudfront_origin_access_identity" "cdn_oai" {
    comment                         = "Dev CDN OAI"
}

resource "aws_cloudfront_distribution" "cdn_distribution" {
    origin {
        domain_name                 = var.s3_bucket_domain_name
        origin_id                   = var.s3_origin_id

        s3_origin_config {
            origin_access_identity = aws_cloudfront_origin_access_identity.cdn_oai.cloudfront_access_identity_path
        }
    }

    aliases = [var.cdn_alias]

    logging_config {
        include_cookies             = false
        bucket                      = var.s3_log_domain_name
        prefix                      = "cdn_logs"
    }

    default_cache_behavior {
        allowed_methods             = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        cached_methods              = ["GET", "HEAD"]
        target_origin_id            = var.s3_origin_id

        forwarded_values {
            query_string            = false

            cookies {
                forward              = "none"
            }
        }

        viewer_protocol_policy      = "redirect-to-https"
        min_ttl                     = 0
        default_ttl                 = 3600
        max_ttl                     = 86400
    }

    viewer_certificate {
        acm_certificate_arn         = var.cdn_acm_arn
        ssl_support_method          = "sni-only"
        minimum_protocol_version    = "TLSv1.2_2019"
    }

    restrictions {
        geo_restriction {
            restriction_type            = "none"
        }
    }

    enabled                         = true
    is_ipv6_enabled                 = true
    comment                         = "Dev CloudFront CDN"
    price_class                     = "PriceClass_100"
}

resource "aws_cloudfront_public_key" "cdn_public_key" {
    comment                         = "Dev CDN Public Key"
    encoded_key                     = file("./assets/cloudfront/public_key.pem")
    name                            = "cdn_key"
}