data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "main" {
  id = "vpc-9a3bcdf0"
}

data "aws_security_group" "my_ec2_sg" {
  id = "sg-8af416e8"
}

data "template_file" "user_data" {
  template = file("./user-data.yaml")
}