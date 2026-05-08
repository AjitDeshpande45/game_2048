resource "aws_instance" "sonar-server" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  security_groups = var.security_groups
  subnet_id = var.subnet_id
  tags = {
    Name = "Sonar-server"
  }
}