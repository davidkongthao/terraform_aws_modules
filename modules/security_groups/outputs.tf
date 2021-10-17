output "admin_security_group" {
    value = aws_security_group.admin_security_group.id
}

output "dmz_security_group" {
    value = aws_security_group.dmz_security_group.id
}

output "app_security_group" {
    value = aws_security_group.app_security_group.id
}

output "db_security_group" {
    value = aws_security_group.db_security_group.id
}
