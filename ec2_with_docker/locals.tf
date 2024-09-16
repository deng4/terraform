locals {
  Prefix       = "TMS"
  Usage        = "Docker VM for TMS"
  Owner        = "Dzianis Soika"
  CreationDate = "date-${formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())}"
  StartUpScriptDocker = file("./docker_install.sh")
}
