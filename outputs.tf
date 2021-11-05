output "secret_keys" {
    value = nonsensitive(module.iam.ent_admins_secret_keys)
}

output "access_keys" {
    value = nonsensitive(module.iam.ent_admins_access_keys)
}

output "primary_db" {
    value = module.rds.primary_db
}
