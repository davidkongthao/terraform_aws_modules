output "enterprise_kms_key" {
    value = aws_kms_key.enterprise_kms_key.arn
}

output "ec2_kms_key" {
    value = aws_kms_key.ec2_kms_key.arn
}