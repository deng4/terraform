variable "my_ip" {}
variable "vpc_id" {}
variable "deployer_user" {}
variable "instance_type" {
  type    = string
  default = "t2.micro"
  validation {
    condition     = can(regex("^t2.", var.instance_type))
    error_message = "Something went wrong"
  }
}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 8080, 9000]
}

variable "workspace_iam_roles" {
  default = {
    staging    = "arn:aws:iam::STAGING-ACCOUNT-ID:/role/Terraform"
    production = "arn:aws:iam::PRODUCTION-ACCOUNT-ID:/role/Terraform"

  }
}
