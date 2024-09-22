resource "aws_instance" "myec2" {
  ami                         = data.aws_ami.my_image.image_id
  key_name                    = "my_aws_acc"
  associate_public_ip_address = "ture" ### CREATE ELSTIC IP TO ATTACH TO VM
  private_dns_name_options {
    enable_resource_name_dns_a_record = "true"
  }

  vpc_security_group_ids = var.security_groups_ids
  subnet_id              = var.subnet_id

}


variable "subnet_id" {}
variable "security_groups_ids" {}

