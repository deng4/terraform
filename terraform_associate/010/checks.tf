# resource "null_resource" "check_web_server" {
#     depends_on = [ aws_instance.my_server ]


#     provisioner "local-exec" {
#         command = <<EOT
#         for i in 1..5 
#             do
#                 if curl -I "http://${aws_instance.my_server.public_ip}:80"; then
#                     echo "Web server is up!"
#                     exit 0
#                 else
#                     echo "Waiting for web server to become available, count=$i"
#                     sleep 10
#                 fi
#             done
#         echo "Web server is still not available after 5 retries"
#         exit 1
#         EOT
#     }
# }

# resource "null_resource" "check_ssh_accessibility" {
#   depends_on = [aws_instance.my_server]

#   provisioner "local-exec" {
#     command = <<EOT
#         for i in 1..5
#             do
#                 if nc -zv ${aws_instance.my_server.public_ip} 22; then
#                     echo "SSH is accessible!"
#                     exit 0
#                 else
#                     echo "Still waiting for SSH.."
#                     sleep 10
#                 fi
#             done
#         echo "SSH is still not accessible after 5 tries"
#         exit 1
#         EOT
#     interpreter = [ bash ]
#   }
# }