resource "aws_kms_key" "enterprise_kms_key" {
    description                     = "Enterprise KMS Key for Encryption."
    customer_master_key_spec        = "RSA_4096"

    tags = {
        Name                        = "EnterpriseKMSKey"
        Alias                       = "EnterpriseKMSKey"
    }
}