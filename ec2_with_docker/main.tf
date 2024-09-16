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
  associate_public_ip_address = "true" ### CREATE ELSTIC IP TO ATTACH TO VM
  private_dns_name_options {
    enable_resource_name_dns_a_record = "true"
  }

  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  subnet_id              = aws_subnet.docker_subnet.id
  user_data              = local.StartUpScriptDocker

  tags = {
    Name         = "MyDockerEC2"
    Purpose      = local.Usage
    Owner        = local.Owner
    CreationDate = local.CreationDate
  }
}