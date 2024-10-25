output "public_ip" {
  value = aws_instance.web.public_ip
}

output "connection_string" {
  value = "ssh -i /home/den4/.ssh/id_ed25519 ubuntu@${aws_instance.web.public_ip}"
}

output "instance_type_output" {
  value = var.instance_type
}