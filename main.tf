#####################################################################################
# IAM role
#####################################################################################
resource "aws_iam_role" "prod-ci-role" {
  name = "prod-ci-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

#####################################################################################
# IAM user
#####################################################################################
resource "aws_iam_user" "prod-ci-user" {
  name = "prod-ci-user"
}

#####################################################################################
# IAM group
#####################################################################################
resource "aws_iam_group" ", prod-ci-group" {
  name = "prod-ci-group"
}

#####################################################################################
# IAM policy
#####################################################################################
resource "aws_iam_policy" "prod-ci-policy" {
  name        = "prod-ci-policy"
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "prod-ci-attach" {
  name       = "prod-ci-attach"
  users      = [aws_iam_user.prod-ci-user.name]
  roles      = [aws_iam_role.prod-ci-role.name]
  groups     = [aws_iam_group.prod-ci-group.name]
  policy_arn = aws_iam_policy.prod-ci-policy.arn
}