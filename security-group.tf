# Creates Security Group
resource "aws_security_group" "allow_mongodb" {
  name        = "roboshop-${var.ENV}"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from Public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # [] represent's list. 
  }

  ingress {
    description = "HTTP from Public"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # [] represent's list. 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sg"
  }
}