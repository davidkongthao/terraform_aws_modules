resource "aws_acm_certificate" "dev_cdn_cert" {
    domain_name                 = var.cdn_alias
    validation_method           = "DNS"
}

data "aws_route53_zone" "primary_zone" {
    name                        = var.primary_dns_name
    private_zone                = false
}

resource "aws_route53_record" "dev_cdn_validation" {
    for_each                    = {
        for dvo in aws_acm_certificate.dev_cdn_cert.domain_validation_options : dvo.domain_name => {
            name                = dvo.resource_record_name
            record              = dvo.resource_record_value
            type                = dvo.resource_record_type
        }
    }

    allow_overwrite             = true
    name                        = each.value.name
    records                     = [each.value.record]
    ttl                         = 60
    type                        = each.value.type
    zone_id                     = data.aws_route53_zone.primary_zone.zone_id
}

resource "aws_acm_certificate_validation" "dev_cdn_cert_validation" {
    certificate_arn             = aws_acm_certificate.dev_cdn_cert.arn
    validation_record_fqdns     = [for record in aws_route53_record.dev_cdn_validation : record.fqdn]
}
