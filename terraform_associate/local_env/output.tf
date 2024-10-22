output "public_ip" {
  value = aws_instance.web.public_ip
}

output "connect_string" {
  value = "ssh -i /home/den4/.ssh/id_rsa ubuntu@${aws_instance.web.public_ip}"
}