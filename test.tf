provider "aws" {
    region = "eu-west-2"
}
module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"
  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-12345670"

  ingress_cidr_blocks = ["0.0.0.0/0"]
}
