# resource "aws_instance" "myec2" {
#   ami                         = data.aws_ami.my_image.image_id
#   instance_type               = var.environment == "test" ? "t2.micro" : "t3a.medium"
#   key_name                    = "my_aws_acc"
#   associate_public_ip_address = "false" ### CREATE ELSTIC IP TO ATTACH TO VM
#   private_dns_name_options {
#     enable_resource_name_dns_a_record = "true"
#   }

#   vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
#   subnet_id              = aws_subnet.docker_subnet.id
#   user_data              = local.StartUpScriptDocker

#   tags = {
#     Name         = "MyDockerEC2"
#     Purpose      = local.Usage
#     Owner        = local.Owner
#     CreationDate = local.CreationDate
#   }

#   lifecycle {
#     create_before_destroy = true
#     ignore_changes = [ tags["CreationDate"], private_dns_name_options ]
#   }
# }



module "my_ec2" {
  source="./modules/ec2"
  subnet_id = "${aws_subnet.docker_subnet.id}"
  security_groups_ids = "${aws_security_group.allow_ssh_http.id}"
}