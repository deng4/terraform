variable "my_ip" {}
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

provider "aws" { region = "us-east-1" }

variable "list" {
  type = list
  
}
variable "my_list" { default = ["value1", "value2"] }