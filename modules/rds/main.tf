resource "aws_db_instance" "primary_db" {
    allocated_storage               = 50
    engine                          = var.db_engine
    engine_version                  = var.db_engine_version
    instance_class                  = var.db_instance_class
    identifier                      = var.primary_db_identifier
    name                            = var.db_name
    username                        = var.db_username
    password                        = var.db_password
    availability_zone               = var.db_az
    db_subnet_group_name            = var.db_subnet_group_name
    vpc_security_group_ids          = [var.admin_security_group, var.db_security_group]
    skip_final_snapshot             = true
    publicly_accessible             = true
    apply_immediately               = true
    storage_encrypted               = true

    tags = {
        Name                        = "${var.db_name}"
    }
} 