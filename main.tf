terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

resource "aws_instance" "myec2" {
  ami                         = "ami-04f76ebf53292ef4d"
  instance_type               = var.environment == "test" ? "t2.micro" : "t3a.medium"
  key_name                    = "my_aws_acc"
  associate_public_ip_address = "false" ### CREATE ELSTIC IP TO ATTACH TO VM
  private_dns_name_options {
    enable_resource_name_dns_a_record = "true"
  }

  # network_interface {
  #   network_interface_id = aws_network_interface.docker_ec2_interface.id
  #   device_index         = 0
  # }
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  subnet_id              = aws_subnet.docker_subnet.id
  user_data              = file("./docker_install.sh")

  tags = {
    Name         = "My Terraform VM"
    Usage        = "Docker VM for TMS"
    Owner        = "Dzianis Soika"
    CreationDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

# resource "aws_ec2_instance_state" "name" {
#   instance_id = aws_instance.myec2.id
#   state       = "stopped"

# }