# resource "aws_iam_user" "lb" {
#   name  = "iamuser.${count.index}"
#   count = 3
#   path  = "/system/"

#   provisioner "local-exec" {
#     command = "echo ${self.name} >> names.txt"
#   }
# }

# output "arns" {
#   value = aws_iam_user.lb[*].arn
# }

# output "name" {
#   value = aws_iam_user.lb[*].name
# }

# output "combined" {
#   value=zipmap(aws_iam_user.lb[*].arn, aws_iam_user.lb[*].name)
# }