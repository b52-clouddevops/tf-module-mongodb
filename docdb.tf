# This block provisions document db cluster on aws 

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "roboshop1"
  db_subnet_group_name    = aws_docdb_subnet_group.docdb.id
#   backup_retention_period = 5                        Uncomment only when you need backups
#   preferred_backup_window = "07:00-09:00"
#   skip_final_snapshot     = true
}

# Creates Subnet Group 
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-${var.ENV}-docdb-subnet-grp"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}-docdb-subnet-grp"
  }
}

# Provision the nodes needed for doc-db and add them to the docdb cluster.
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "roboshop-${var.ENV}-docdb-nodes"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
}

# Our application is not designed to 