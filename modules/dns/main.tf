resource "aws_route53_zone" "primary_zone" {
    name                = var.primary_dns_name
}