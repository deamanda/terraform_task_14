resource "aws_security_group" "ssh_security_group" {
  name   = var.ssh_sg
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }
}


resource "aws_security_group" "public_http_security_group" {
  name   = var.public_http_sg
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }
}

resource "aws_security_group" "private_http_security_group" {
  name   = var.private_http_sg
  vpc_id = var.vpc_id
  ingress {
    security_groups = [aws_security_group.public_http_security_group.id]
    from_port       = 80
    protocol        = "tcp"
    to_port         = 80
  }
}
