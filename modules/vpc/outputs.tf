output "main_vpc" {
    value = aws_vpc.main.id
}

output "db_subnets" {
    value = [aws_subnet.db_subnet_a.id, aws_subnet.db_subnet_b.id, aws_subnet.db_subnet_c.id]
}

output "db_subnet_group_name" {
    value = aws_db_subnet_group.primary_db_subnet_group.name
}