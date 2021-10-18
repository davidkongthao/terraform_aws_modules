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
    for_each            = toset(var.admins)
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