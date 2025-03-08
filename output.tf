# output "ec2_public_ip" {
#   description = "Ip public de la instancia"
#   value       = aws_instance.public_instance.public_ip
# }

output "ec2_public_ips" {
  value = { for k, instance in aws_instance.public_instance : k => instance.public_ip }
}
