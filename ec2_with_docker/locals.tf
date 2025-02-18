
locals {
  Prefix              = "TMS"
  Usage               = "Docker VM for TMS"
  Owner               = "Dzianis Soika"
  CreationDate        = "date-${formatdate("DDMMMYYYY", timestamp())}"
  StartUpScriptDocker = file("./apache_install.sh")

  instance_type = {
    default = "t2.micro"
    dev = "t2.medium"
    prod = "t3a.medium"
  }
}