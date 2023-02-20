# This block provisions document db on aws 

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "roboshop--${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
#   backup_retention_period = 5                        Uncomment only when you need backups
#   preferred_backup_window = "07:00-09:00"
#   skip_final_snapshot     = true
}