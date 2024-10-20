resource "aws_security_group" "main" {
    name = "main_security_group"
    vpc_id = "vpc-9a3bcdf0"
}

resource "aws_vpc_security_group_ingress_rule" "name" {
    security_group_id = aws_security_group.main.id
    cidr_ipv4 = ["${var.my_ip}/32"]
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22  
}