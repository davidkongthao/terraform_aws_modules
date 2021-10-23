data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "main" {
    cidr_block              = var.cidr_block
    instance_tenancy        = var.instance_tenancy
    enable_dns_support      = var.enable_dns_support
    enable_dns_hostnames    = var.enable_dns_hostnames

    tags = {
        Name = "MainVPC"
    }
}

resource "aws_subnet" "dmz_subnet_a" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.dmz_subnet_cidrs[0]
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name                = "DMZSubnetA"
    }
}

resource "aws_subnet" "dmz_subnet_b" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.dmz_subnet_cidrs[1]
    availability_zone       = data.aws_availability_zones.available.names[1]

    tags = {
        Name                = "DMZSubnetB"
    }
}

resource "aws_subnet" "dmz_subnet_c" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.dmz_subnet_cidrs[2]
    availability_zone       = data.aws_availability_zones.available.names[2]

    tags = {
        Name                = "DMZSubnetC"
    }
}

resource "aws_subnet" "app_subnet_a" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.app_subnet_cidrs[0]
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name                = "AppSubnetA"
    }
}

resource "aws_subnet" "app_subnet_b" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.app_subnet_cidrs[1]
    availability_zone       = data.aws_availability_zones.available.names[1]

    tags = {
        Name                = "AppSubnetB"
    }
}

resource "aws_subnet" "app_subnet_c" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.app_subnet_cidrs[2]
    availability_zone       = data.aws_availability_zones.available.names[2]

    tags = {
        Name                = "AppSubnetC"
    }
}

resource "aws_subnet" "db_subnet_a" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.db_subnet_cidrs[0]
    availability_zone       = data.aws_availability_zones.available.names[0]

    tags = {
        Name = "DBSubnetA"
    }
}

resource "aws_subnet" "db_subnet_b" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.db_subnet_cidrs[1]
    availability_zone       = data.aws_availability_zones.available.names[1]

    tags = {
        Name = "DBSubnetB"
    }
}

resource "aws_subnet" "db_subnet_c" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = var.db_subnet_cidrs[2]
    availability_zone       = data.aws_availability_zones.available.names[2]

    tags = {
        Name                = "DBSubnetC"
    }
}

resource "aws_db_subnet_group" "primary_db_subnet_group" {
    name                    = "primary-db-subnet-group"
    subnet_ids              = [aws_subnet.db_subnet_a.id, aws_subnet.db_subnet_b.id, aws_subnet.db_subnet_c.id]
    description             = "Primary subnet group for DB tier."

    tags = {
        Name                = "primary-db-subnet-group"
    }
}