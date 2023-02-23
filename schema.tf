resource "null_resource" "docdb-schema" {
  
  # This is how we can create depenency and ensure this will only run after the creation if the RDS Instance.
  depends_on = [aws_docdb_cluster.docdb]

  provisioner "local-exec" {
        command = <<EOF
        cd /tmp 
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
unzip -o mongodb.zip
cd mongodb-main
mongo < catalogue.js
        EOF
  }  
}