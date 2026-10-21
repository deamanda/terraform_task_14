resource "aws_security_group" "ssh_security_group" {
  name   = var.ssh_sg
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }
  tags = {
    Project = "cmtr-otuokx4e"
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

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.allowed_ip_range
  }
  tags = {
    Project = "cmtr-otuokx4e"
  }
}

resource "aws_security_group" "private_http_security_group" {
  name   = var.private_http_sg
  vpc_id = var.vpc_id
  ingress {
    security_groups = [aws_security_group.public_http_security_group.id]
    from_port       = 8080
    protocol        = "tcp"
    to_port         = 8080
  }
  ingress {
    security_groups = [aws_security_group.public_http_security_group.id]
    protocol        = "icmp"
    from_port       = -1
    to_port         = -1
  }
  tags = {
    Project = "cmtr-otuokx4e"
  }
}
