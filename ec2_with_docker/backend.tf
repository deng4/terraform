# terraform {
#   backend "s3" {
#     bucket         = "mycomponents.tfstate"
#     key            = "state/terraform.tfstate"
#     encrypt        = true
#     dynamodb_table = "mycomponents_tf_lockid"
#   }
# }