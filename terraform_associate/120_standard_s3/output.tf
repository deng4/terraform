output "public_ip" {
  value = aws_instance.web.public_ip
}

output "connect_string" {
  value = "ssh -i /home/${var.deployer_user}/.ssh/terraform ec2-user@${aws_instance.web.public_ip}"
}

output "instance_type_output" {
  value = var.instance_type
}

output "ami" {
  value = data.aws_ami.am_linux.id

}