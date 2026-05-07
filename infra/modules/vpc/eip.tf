resource "aws_eip" "production_eip" {
  domain = "vpc"
  tags = {
    Name = "production_eip"
  }
  depends_on                = [aws_internet_gateway.gw]
}