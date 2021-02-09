provider "aws" {
    region = "eu-west-2"
}
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 15
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  max_password_age               = 91
}
module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-12345678"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
