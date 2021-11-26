output "default_instance_profile" {
    value = aws_iam_instance_profile.default_instance_iam_profile.id
}

output "ent_admins_secret_keys" {
    value = toset([
        for key in aws_iam_access_key.admin_access_keys : key.secret
    ])
    sensitive = true
}

output "ent_admins_access_keys" {
    value = toset([
        for key in aws_iam_access_key.admin_access_keys : key.id
    ])
    sensitive = true
}

output "s3_users_secret_keys" {
    value = aws_iam_access_key.s3_access_keys.secret
    sensitive = true
}

output "s3_useres_access_keys" {
    value = aws_iam_access_key.s3_access_keys.id
    sensitive = true
}

output "s3_user" {
    value = aws_iam_user.app_s3_service_user.arn
}