resource "aws_security_group" "allow_ssh_http" {
  name   = "allow_ssh"
  vpc_id = aws_vpc.main.id

  tags = {
    Name  = "docker_http_sg"
    Usage = "install_docker_and_allow_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "${var.my_ip}/32"
  ip_protocol       = "tcp"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "${var.my_ip}/32"
  ip_protocol       = "tcp"
  from_port         = var.http_port
  to_port           = var.http_port
}

resource "aws_vpc_security_group_egress_rule" "name" {
  security_group_id = aws_security_group.allow_ssh_http.id
  ip_protocol       = -1
  cidr_ipv4         = "0.0.0.0/0"

}