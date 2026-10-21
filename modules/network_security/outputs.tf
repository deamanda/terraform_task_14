output "sg_ssh_id" {
  value = aws_security_group.ssh_security_group.id
}

output "sg_public_http_id" {
  value = aws_security_group.public_http_security_group.id
}

output "sg_private_http_id" {
  value = aws_security_group.private_http_security_group.id
}