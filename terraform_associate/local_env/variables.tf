variable "pub_sshkey_for_ec2" {}
variable "my_ip" {}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 8080, 9000]
}