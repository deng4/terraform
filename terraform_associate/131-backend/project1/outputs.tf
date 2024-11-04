output "user_id" {
    value = aws_iam_user.project1_user.id
    description = "Module VPC ID"
}

output "user_name" {
    value = aws_iam_user.project1_user.name
  
}