output "ec2_public_ip" {
  #value = "https://${aws_eip.docker_ec2_public_ip.public_ip}:8080"
  value = aws_instance.myec2.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.myec2.public_dns
}

output "my_external_ip_in_ingress_http" {
  value = aws_vpc_security_group_ingress_rule.allow_http.cidr_ipv4
}

output "my_external_ip_in_ingress_ssh" {
  value = aws_vpc_security_group_ingress_rule.allow_ssh.cidr_ipv4
}