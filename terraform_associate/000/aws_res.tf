resource "aws_instance" "my_server" {
  ami           = "ami-08ec94f928cf25a9d"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer-${local.project_name}"
  }
}