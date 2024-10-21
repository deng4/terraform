terraform {
  cloud {

    organization = "deng4-lab01"

    workspaces {
      name = "provisioners"
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.pub_sshkey_for_ec2
}

resource "aws_instance" "my_server" {
  ami                    = "ami-08ec94f928cf25a9d"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}


