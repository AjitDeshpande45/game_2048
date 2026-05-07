resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.production_eip.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "nat-gw"
  }
  depends_on = [aws_internet_gateway.gw]
}