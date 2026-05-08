# ALB Security Group — accepts HTTPS/HTTP from the internet
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Allow inbound HTTP and HTTPS from internet"
  vpc_id      = aws_vpc.production_vpc.id

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

# ECS Task Security Group — only accepts traffic from ALB on port 3000
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-task-sg"
  description = "Allow inbound from ALB on port 3000 only"
  vpc_id      = aws_vpc.production_vpc.id

  ingress {
    description     = "Allow ALB to reach app on port 3000"
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]  # locked to ALB only
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   # needed to pull images from ECR
  }

  tags = {
    Name = "ecs-task-sg"
  }
}