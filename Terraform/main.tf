provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "ec2_sg" {
  name        = "cloud-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["122.161.50.132/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-secure-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy" "ec2_policy" {
  name = "DescribeInstancesPolicy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = ["ec2:DescribeInstances"]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "ec2_instance" {
  ami                    = "ami-0d188df7cedce7d90"
  instance_type          = "t3.micro"
  security_groups        = [aws_security_group.ec2_sg.name]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = var.instance_name
  }
}
