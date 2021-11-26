output "secret_keys" {
    value = nonsensitive(module.iam.ent_admins_secret_keys)
}

output "access_keys" {
    value = nonsensitive(module.iam.ent_admins_access_keys)
}

output "primary_db" {
    value = module.rds.primary_db
}

output "s3_secret_keys" {
    value = nonsensitive(module.iam.s3_users_secret_keys)
}

output "s3_access_keys" {
    value = nonsensitive(module.iam.s3_useres_access_keys)
}

output "cdn_public_key" {
    value = module.cloudfront.cdn_public_key
}