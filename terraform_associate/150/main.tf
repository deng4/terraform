locals {
  base_cidr_block = "10.0.0.0/16"
  subnet_1        = cidrsubnet(local.base_cidr_block, 8, 0) # Output: "10.0.0.0/24"
  subnet_2        = cidrsubnet(local.base_cidr_block, 8, 1) # Output: "10.0.1.0/24"
  subnet_3        = cidrsubnet(local.base_cidr_block, 8, 2) # Output: "10.0.2.0/24"
}

output "subnet_1" {
  value = local.subnet_1
}

output "subnet_2" {
  value = local.subnet_2
}

output "subnet_3" {
  value = local.subnet_3
}

variable "items" {
    type = list
    default = [null,null,"","last"]
  
}

variable "some" {
  type = map
  default = {
    "he" = "boom",
    "gnarl" = "doomn"
  }
}