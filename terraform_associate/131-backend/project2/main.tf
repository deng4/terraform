terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<6"
    }
  }
}

data "terraform_remote_state" "user_name" {
  backend = "local"
  config = {
    path = "../project1/terraform.tfstate"
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"

}




resource "aws_iam_user" "project2_user" {
  name = "service_user_${data.terraform_remote_state.user_name.outputs.user_name}"
}

output "user_name" {
  value = aws_iam_user.project2_user.name
}