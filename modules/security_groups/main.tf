resource "aws_security_group" "admin_security_group" {
    name                        = "main-admin-sg"
    description                 = "Main Administrators Security Group for Environment."
    vpc_id                      = var.vpc

    ingress = [
        {
            description         = var.security_group_rules[1]
            from_port           = 0
            to_port             = 0
            protocol            = "-1"
            cidr_blocks         = [var.security_group_rules[0]]
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]

    tags = {
        Name                    = "main-admin-sg"
    }
}

resource "aws_security_group" "dmz_security_group" {
    name                        = "main-dmz-sg"
    description                 = "Main security group for DMZ servers."
    vpc_id                      = var.vpc

    ingress = [
        {
            description         = "Allows HTTP access from Public Internet to DMZ servers."
            from_port           = 80
            to_port             = 80
            protocol            = "tcp"
            cidr_blocks         = ["0.0.0.0/0"]
            ipv6_cidr_blocks    = ["::/0"]
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        },
        {
            description         = "Allows HTTPS access from Public Internet to DMZ servers."
            from_port           = 443
            to_port             = 443
            protocol            = "tcp"
            cidr_blocks         = ["0.0.0.0/0"]
            ipv6_cidr_blocks    = ["::/0"]
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        },
    ]

    egress = [
        {
            description         = "Allows outbound connections to Public Internet."
            from_port           = 0
            to_port             = 0
            protocol            = "-1"
            cidr_blocks         = ["0.0.0.0/0"]
            ipv6_cidr_blocks    = ["::/0"]
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]

    tags = {
        Name                    = "main-dmz-sg"
    }
}

resource "aws_security_group" "app_security_group" {
    name                        = "main-app-sg"
    description                 = "Main App security group."
    vpc_id                      = var.vpc

    ingress = [
        {
            description         = "Allows DMZ tier servers to talk to App tier."
            from_port           = 0
            to_port             = 0
            protocol            = "-1"
            cidr_blocks         = []
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = [aws_security_group.dmz_security_group.id]
            self                = false
        },
    ]

    egress = [
        {
            description         = "Allows App tier servers outbound connections."
            from_port           = 0
            to_port             = 0
            protocol            = "-1"
            cidr_blocks         = ["0.0.0.0/0"]
            ipv6_cidr_blocks    = ["::/0"]
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]

    tags = {
        Name                    = "main-app-sg"
    }
}

resource "aws_security_group" "db_security_group" {
    name                        = "main-db-sg"
    description                 = "Main Database security group."
    vpc_id                      = var.vpc

    ingress = [
        {
            description         = "Allows connections to PostgreSQL from App Tier."
            from_port           = 5432
            to_port             = 5432
            protocol            = "tcp"
            cidr_blocks         = []
            ipv6_cidr_blocks    = []
            prefix_list_ids     = []
            security_groups     = [aws_security_group.app_security_group.id]
            self                = false
        }
    ]

    egress = [
        {
            description         = "Allows outbound connections from DB Tier."
            from_port           = 0
            to_port             = 0
            protocol            = "-1"
            cidr_blocks         = ["0.0.0.0/0"]
            ipv6_cidr_blocks    = ["::/0"]
            prefix_list_ids     = []
            security_groups     = []
            self                = false
        }
    ]
    
    tags = {
        Name                    = "main-db-sg"
    }
}