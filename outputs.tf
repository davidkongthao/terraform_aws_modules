output "secret_keys" {
    value = nonsensitive(module.iam.ent_admins_access_keys)
}