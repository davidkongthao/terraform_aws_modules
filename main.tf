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
    dev_s3_bucket           = module.s3.dev_s3_bucket
    s3_service_accounts     = var.s3_service_accounts
}

module "compute" {
    source                  = "./modules/compute"
    iam_profile             = module.iam.default_instance_profile
}

module "dns" {
    source                  = "./modules/dns"
    primary_dns_name        = var.primary_dns_name
    mx_dns_records          = var.mx_dns_records
    sendgrid_dns_records    = var.sendgrid_dns_records
    email_zone_name         = var.email_zone_name
    cdn_cname_name          = var.acm_cdn_alias
    cdn_dns_name            = module.cloudfront.cloudfront_domain_name
}

module "kms" {
    source                  = "./modules/kms"
}

module "s3" {
    source                  = "./modules/s3"
    s3_bucket_name          = var.s3_bucket_name
    s3_log_bucket_name      = var.s3_log_bucket_name
    kms_key                 = module.kms.enterprise_kms_key
}

module "acm" {
    source                  = "./modules/acm"
    providers               = {
        aws                 = aws.useastone
    }
    cdn_alias               = var.acm_cdn_alias
    primary_dns_name        = var.primary_dns_name
}

module "cloudfront" {
    source                  = "./modules/cloudfront"
    s3_bucket_domain_name   = module.s3.s3_bucket_domain_name
    s3_log_domain_name      = module.s3.s3_logs_bucket_domain_name
    s3_origin_id            = var.s3_origin_id
    cdn_aliases             = var.cloudfront_cdn_aliases
    cdn_acm_arn             = module.acm.cdn_acm_arn
}

module "rds" {
    source                  = "./modules/rds"
    vpc                     = module.vpc.main_vpc
    admin_security_group    = module.security_groups.admin_security_group
    db_security_group       = module.security_groups.db_security_group
    db_instance_class       = var.rds_instance_class
    db_name                 = var.rds_db_name
    db_username             = var.rds_username
    db_engine               = var.rds_engine
    db_engine_version       = var.rds_engine_version
    db_password             = var.rds_password
    db_az                   = var.rds_db_az
    primary_db_identifier   = var.primary_rds_identifier
    db_subnets              = module.vpc.db_subnets
    db_subnet_group_name    = module.vpc.db_subnet_group_name
}