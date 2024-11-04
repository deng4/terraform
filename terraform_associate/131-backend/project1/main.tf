terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "<6"
    }
  }
}

provider "aws" {
    profile = "default"
    region = "eu-central-1"
  
}

resource "aws_iam_user" "project1_user" {
    name = "project1_user_Jack"
}