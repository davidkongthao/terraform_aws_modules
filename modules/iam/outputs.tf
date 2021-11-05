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

