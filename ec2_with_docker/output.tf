output "ec2_public_ip" {
  #value = "https://${aws_eip.docker_ec2_public_ip.public_ip}:8080"
  value = aws_instance.myec2.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.myec2.public_dns
}

output "my_external_ip_in_ingress_http" {
  value = var.my_ip
}
