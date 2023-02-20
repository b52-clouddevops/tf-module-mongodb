# This block provisions document db on aws 

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
#   backup_retention_period = 5                        Uncomment only when you need backups
#   preferred_backup_window = "07:00-09:00"
#   skip_final_snapshot     = true
}

# Creates Subnet Group 

resource "aws_docdb_subnet_group" "docdb" {
  name       = "main"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My docdb subnet group"
  }
}