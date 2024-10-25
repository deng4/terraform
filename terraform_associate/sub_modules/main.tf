
module "aws_server" {
    source = "./modules/ec2_instance"
    my_ip = var.my_ip
}

output "public_ip" {
    value = module.aws_server.public_ip
}

output "connection_string" {
    value = module.aws_server.connection_string  
}