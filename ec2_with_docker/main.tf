module "my_ec2" {
  source              = "./modules/ec2"
  instance_type       = local.instance_type[terraform.workspace]
  key_name            = var.key_name
  subnet_id           = aws_subnet.docker_subnet.id
  security_groups_ids = aws_security_group.allow_ssh_http.id


  startup_script = local.StartUpScriptDocker

  # TAGS SECTION

  Owner        = local.Owner
  Purpose      = local.Usage
  CreationDate = local.CreationDate
}