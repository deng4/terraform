locals {
  Prefix              = "TMS"
  Usage               = "Docker VM for TMS"
  Owner               = "Dzianis Soika"
  CreationDate        = "date-${formatdate("DDMMMYYYY", timestamp())}"
  StartUpScriptDocker = file("./docker_install.sh")
}
