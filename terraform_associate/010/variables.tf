variable "instance_type" {}
variable "my_ip" {} # export TF_VAR_my_ip=$(curl ipinfo.io/ip)
variable "allow_all" {}
variable "pub_sshkey_for_ec2" {}
variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [22, 80, 8080, 9000]
}