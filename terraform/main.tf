provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"  # Specify your desired AMI ID
  instance_type = "t2.micro"  # Specify your desired instance type

  tags = {
    Name = "WebServerInstance"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Specify your desired VPC CIDR block

  tags = {
    Name = "MyVPC"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow incoming traffic to the web server"

  vpc_id = aws_vpc.my_vpc.id

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
}
