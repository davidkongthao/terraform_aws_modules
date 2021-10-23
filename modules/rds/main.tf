resource "aws_db_instance" "primary_db" {
    allocated_storage               = 30
    engine                          = "postgres"
    instance_class                  = var.db_instance_class
    name                            = var.db_name
    username                        = var.db_username
    password                        = var.db_password
    availability_zone               = var.db_az
    db_subnet_group_name            = var.db_subnet_group_name
    vpc_security_group_ids          = [var.admin_security_group, var.db_security_group]
    skip_final_snapshot             = true

    tags = {
        Name                        = "${var.db_name}"
    }
} 