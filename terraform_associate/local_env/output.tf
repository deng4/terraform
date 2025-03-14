output "public_ip" {
  value = aws_instance.web.public_ip
}

output "connect_string" {
  value = "ssh -i /home/den4/.ssh/id_ed25519 ubuntu@${aws_instance.web.public_ip}"
}

output "instance_type_output" {
  value = var.instance_type
}

output "s3_central" {
  value = aws_s3_bucket.central_bucket.region
}

output "s3_west" {
  value = aws_s3_bucket.west_bucket.region
  
}