resource "aws_route53_zone" "primary_zone" {
    name                = var.primary_dns_name
}

resource "aws_route53_record" "primary_mx_records" {
    zone_id             = aws_route53_zone.primary_zone.id
    name                = var.primary_dns_name
    type                = "MX"
    ttl                 = 300
    records             = var.mx_dns_records
}

resource "aws_route53_record" "sendgrid_dns_records" {
    for_each            = var.sendgrid_dns_records
    zone_id             = aws_route53_zone.primary_zone.id
    name                = each.key
    type                = "CNAME"
    ttl                 = 300
    records             = [each.value]
}