provider "aws" {
  region  = "ap-south-1"
}

data "aws_availability_zones" "available" {
		  state = "available"
}
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "customvpc"
  }
}

resource "aws_subnet" "PublicSubnet1" {
  cidr_block = var.public_subnet
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Public Subnet AZ A"
  }
}

resource "aws_subnet" "PublicSubnet2" {
  cidr_block = var.public_subnet2
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc.id
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Public Subnet AZ B"
  }
}



resource "aws_route_table" "RouteTablePublic" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [ aws_internet_gateway.Igw ]

  tags = {
    Name = "Public Route Table"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Igw.id
  }
}

resource "aws_route_table_association" "AssociationForRouteTablePublic0" {
  subnet_id = aws_subnet.PublicSubnet1.id
  route_table_id = aws_route_table.RouteTablePublic.id
}



resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_security_group" "SecurityGroup1" {
  name = "custom-sg"
  description = "Build a custom security group."
  vpc_id = aws_vpc.vpc.id

ingress {
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
}

}
