output "instance_id" {
  value = aws_instance.tf-instance.id
}
output "instance_public_ip" {
  value = aws_instance.tf-instance.public_ip
}
output "instance_private_ip" {
  value = aws_instance.tf-instance.private_ip
}