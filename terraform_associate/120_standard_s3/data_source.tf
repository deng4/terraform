data "aws_ami" "am_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-2023*x86_64"]
  }
}

data "template_file" "default" {
  template = file("${path.module}/start_up.sh")
}