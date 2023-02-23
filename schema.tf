resource "null_resource" "docdb-schema" {
  
  # This is how we can create depenency and ensure this will only run after the creation if the RDS Instance.
  depends_on = ["aws_docdb_cluster.docdb]

  provisioner "local-exec" {
        command = <<EOF
        cd /tmp 
        curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
        unzip mysql.zip 
        cd mysql-main 
        mysql -h ${aws_db_instance.mysql5.address} -u admin1 -pRoboShop1 <shipping.sql
        EOF
  }  
}