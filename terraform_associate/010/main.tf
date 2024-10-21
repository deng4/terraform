terraform {
  required_providers {
    aws = {
      version = "~>5"
    }
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.pub_sshkey_for_ec2
}

resource "aws_instance" "my_server" {
  ami                    = "ami-0084a47cc718c111a"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  user_data              = data.template_file.user_data.rendered

  provisioner "remote-exec" {
    inline = [
      "#!/bin/bash", 
      "echo ${aws_instance.my_server.private_ip} >> /home/ubuntu/ec2_private_ip",
     ]
     connection {
       type = "ssh"
       user = "ubuntu"
       host = aws_instance.my_server.public_ip
       private_key = "${fie("~/.ssh/id_ed25519")}"
     }
  }

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}


