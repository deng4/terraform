variable "vpc_cidr" {}

variable "subnet_cidr" {}

variable "allow_all" {}

variable "my_ip" {}

variable "ssh_port" {}

variable "http_port" {}

variable "environment" {}

variable "region" {}

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 8080, 9000]
}