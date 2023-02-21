# Creates Security Group
resource "aws_security_group" "allow_mongodb" {
  name        = "roboshop-${var.ENV}-mongodb-sg"
  description = "Allow 27017 inbound traffic from intranet only"

  ingress {
    description = "Allow DOCDB From Local Network"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]   # [] represent's list. 
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