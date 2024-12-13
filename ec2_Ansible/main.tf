terraform {
  required_providers {
    aws = {
        version = "<6"
    }
  }
}

data "aws_ami" "ec2_recent_ubuntu_ami" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
  name = "name"
  values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ansible_master" {
    ami = data.aws_ami.ec2_recent_ubuntu_ami.id
    instance_type = "t3.small"
    key_name = "terraform"
    user_data = "${file("ansible.yaml")}"
    tags = {
      Name = "Ansible_Master"
    }
}

resource "aws_instance" "ansible_minion" {
    ami = data.aws_ami.ec2_recent_ubuntu_ami.id
    instance_type = "t3.micro"
    key_name = "terraform"

    depends_on = [ aws_instance.ansible_master ]

    tags = {
      Name = "Ansible_Minion"
    }
}

output "public_dns_master" {
    value = "ssh -i ~/.ssh/terraform ubuntu@${aws_instance.ansible_master.public_dns}"
}

output "public_dns_minion" {
    value = "ssh -i ~/.ssh/terraform ubuntu@${aws_instance.ansible_minion.public_dns}"
}

#ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICfd/vkSyDnwbSlbUq9Q3yF0Y/ZTudMqSgNzBh8HSYfG ubuntu@ip-172-31-9-253