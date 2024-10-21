# variable "iam_names" {
#   type = list(string)
#   default = [ "user-0","user-01", "user-02", "user-03", "user-04" ]
  
# }

# resource "aws_iam_user" "lb" {
#   for_each  = toset( var.iam_names )
#   name = each.key
#   path  = "/system/"
# }
