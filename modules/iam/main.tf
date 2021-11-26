resource "aws_iam_instance_profile" "default_instance_iam_profile" {
    name                = "default_iam_profile"
    role                = aws_iam_role.default_iam_role.name
}

resource "aws_iam_role" "default_iam_role" {
    name                = "default_iam_role"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action  = "sts:AssumeRole"
                Effect  = "Allow"
                Sid     = ""
                Principal = {
                    Service     = "ec2.amazonaws.com"
                }
            }
        ]
    })

    tags = {
        Name            = "default_iam_role"
    }
}

resource "aws_iam_user" "admin_users" {
    for_each            = toset(var.admins)
    name                = each.key
}

resource "aws_iam_access_key" "admin_access_keys" {
    for_each            = aws_iam_user.admin_users
    user                = each.key
}

resource "aws_iam_group_policy" "enterprise_administrators_policy" {
    name                = "enterprise_administrators_policy"
    group               = aws_iam_group.enterprise_administrators.name
    
    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    })
}

resource "aws_iam_group" "enterprise_administrators" {
    name                = "enterprise_administrators"
}

resource "aws_iam_group_membership" "enterprise_administrators" {
    name                = "enterprise_admin"
    users               = var.admins
    group               = aws_iam_group.enterprise_administrators.name
}

resource "aws_iam_user" "app_s3_service_user" {
    name                = var.s3_service_account
}

resource "aws_iam_access_key" "s3_access_keys" {
    user                = aws_iam_user.app_s3_service_user.id
}

resource "aws_iam_user_policy" "app_s3_user_policy" {
    name                = "DevS3UserPolicy"
    user                = aws_iam_user.app_s3_service_user.name

    policy              = jsonencode({
        Version     =   "2012-10-17"
        Statement   = [
            {
                Action  = [
                    "s3:PutObject",
                    "s3:GetObjectAcl",
                    "s3:GetObject",
                    "s3:ListBucket",
                    "s3:DeleteObject",
                    "s3:PutObjectAcl"
                ]
                Effect      = "Allow"
                Resource    = [
                    "${var.app_s3_bucket}",
                    "${var.app_s3_bucket}/*"
                ]
            },
        ]
    })
}