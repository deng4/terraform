provider "aws" {}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.pub_sshkey_for_ec2
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = aws_key_pair.deployer.key_name
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  provisioner "remote-exec" {
    inline = [ 
      "echo ${aws_instance.web.private_ip} >> /home/ubuntu/ec2_private_ip"
     ]
     connection {
       type = "ssh"
       user = "ubuntu"
       host = "${self.public_ip}"
       private_key = "${file("~/.ssh/id_ed25519")}"
     }
  }

  tags = {
    Name = "my_local_env_ec2"
  }
}