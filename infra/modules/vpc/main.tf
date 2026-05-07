resource "aws_vpc" "production_vpc" {
  cidr_block       = var.vpc-cidr-block
  tags = {
    Name = "production_vpc"
  }
}