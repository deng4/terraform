provider "aws" {
    region = "central-eu-1"
}

resource "aws_key_pair" "deployer" {
    key_name = "deployer-key"
    public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBS7jL4oq5XfQNLntZhmjOrxFjdxEANC3nHGbMy6zbCw den@ub"
}

resource "aws_instance" "my_server" {
  ami           = "ami-08ec94f928cf25a9d"
  instance_type = var.instance_type
  key_name = "${aws_key_pair.deployer.key_name}"
  security_groups = ["sg-8af416e8"]

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}


