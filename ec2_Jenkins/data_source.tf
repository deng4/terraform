data "aws_ami" "ec2_recent_ubuntu_emi" {
  most_recent = true
  owners = ["099720109477"] # Canonical

  filter {
  name = "name"
  values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}