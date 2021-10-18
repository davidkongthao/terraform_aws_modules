module "vpc" {
    source                  = "./modules/vpc"
    cidr_block              = var.vpc_cidr_block
    instance_tenancy        = var.vpc_instance_tenancy
    enable_dns_support      = var.enable_dns_support
    enable_dns_hostnames    = var.enable_dns_hostnames
    dmz_subnet_cidrs        = [var.dmz_subnet_cidr_a, var.dmz_subnet_cidr_b, var.dmz_subnet_cidr_c]
    app_subnet_cidrs        = [var.app_subnet_cidr_a, var.app_subnet_cidr_b, var.app_subnet_cidr_c]
    db_subnet_cidrs         = [var.db_subnet_cidr_a, var.db_subnet_cidr_b, var.db_subnet_cidr_c]
}

module "security_groups" {
    source                  = "./modules/security_groups"
    vpc                     = module.vpc.main_vpc
    security_group_rules    = var.security_group_rules
}

module "iam" {
    source                  = "./modules/iam"
    admins                  = var.admin_users
}