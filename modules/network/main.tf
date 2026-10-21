resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc
  }
}

resource "aws_subnet" "subnet1" {
  availability_zone       = var.az1
  cidr_block              = var.cidr1
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet1
  }
}

resource "aws_subnet" "subnet2" {
  availability_zone       = var.az2
  cidr_block              = var.cidr2
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet1
  }
}

resource "aws_subnet" "subnet3" {
  availability_zone       = var.az3
  cidr_block              = var.cidr3
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet3
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.ig
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.rt
  }
}

resource "aws_route_table_association" "rt_association-1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt_association-2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rt_association-3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rt.id
}