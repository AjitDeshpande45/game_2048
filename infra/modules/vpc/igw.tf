resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.production_vpc.id
  tags = {
    Name = "production-igw"
  }
}