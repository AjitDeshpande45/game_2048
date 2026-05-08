resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.production_vpc.id
  cidr_block = var.public-subnet-cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "production_public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.production_vpc.id
  cidr_block = var.private-subnet-cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "production_private_subnet"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.production_vpc.id
  cidr_block        = var.public-subnet-cidr-b
  availability_zone = "us-east-1b"
  tags = {
    Name = "production_public_subnet_b"
  }
}