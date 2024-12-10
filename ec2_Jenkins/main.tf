terraform {
  required_providers {
    aws = {
        version = "<6"
    }
  }
}

resource "aws_instance" "master" {
    ami = data.aws_ami.ec2_recent_ubuntu_emi.id
    instance_type = "t3.medium"
    user_data = file("./jenkins.yaml")
    key_name = "terraform"

    root_block_device {
      volume_size = 15
    }

    tags = {
      Name = "jenkins_master"
    }
}

resource "aws_instance" "minion" {
  ami = data.aws_ami.ec2_recent_ubuntu_emi.id
  instance_type = "t3.micro"
  key_name = "terraform"

  tags = {
    Name = "jenkins_minion"
  }
}