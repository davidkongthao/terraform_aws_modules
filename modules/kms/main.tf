resource "aws_kms_key" "enterprise_kms_key" {
    description                     = "Enterprise KMS Key for Encryption."
    customer_master_key_spec        = "RSA_4096"

    tags = {
        Name                        = "EnterpriseKMSKey"
        Alias                       = "EnterpriseKMSKey"
    }
}

resource "aws_kms_key" "ec2_kms_key" {
    description                     = "Enterprise KMS Key for EC2 Encryption."
    customer_master_key_spec        = "RSA_4096"

    tags = {
        Name                        = "EC2_KMS_Key"
        Alias                       = "EC2_KMS_Key"
    }
}