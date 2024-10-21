data "aws_vpc" "main" {
  id = "vpc-9a3bcdf0"
}

data "aws_security_group" "my_ec2_sg" {
  id = "sg-8af416e8"
}

data "template_file" "user_data" {
  template = file("./user_data.yaml")
}