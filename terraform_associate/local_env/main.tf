provider "aws" {
  region = "eu-central-1"
  alias = "central"
}

provider "aws" {
  region = "eu-west-2"
  alias = "west"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("/home/den4/.ssh/id_ed25519.pub")
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  key_name               = aws_key_pair.deployer.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  user_data              = data.template_file.user_data.rendered

  tags = {
    Name = "my_local_env_ec2"
  }
}

resource "aws_s3_bucket" "central_bucket" {
  bucket = "mybucket2133-central"
  provider = aws.central
}

resource "aws_s3_bucket" "west_bucket" {
  bucket = "mybucket2133-west"
  provider = aws.west
}




# provisioner "local-exec" {
#   command = "echo ${self.public_ip} >> public_ip.txt"
# }

# provisioner "file" {
#   content     = "ami user: ${self.ami}"
#   destination = "/home/ubuntu/barsoon.txt"

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     host        = self.public_ip
#     private_key = file("~/.ssh/id_ed25519")
#   }
# }

# provisioner "remote-exec" {
#   inline = [ 
#     "echo ${aws_instance.web.private_ip} >> /home/ubuntu/ec2_private_ip"
#    ]
#    connection {
#      type = "ssh"
#      user = "ubuntu"
#      host = "${self.public_ip}"
#      private_key = "${file("~/.ssh/id_ed25519")}"
#    }
# }
