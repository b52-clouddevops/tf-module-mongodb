
# Creates CNAME record for the docdb endpoint.
resource "aws_route53_record" "record" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTEDZONE_ID
  name    = "mongodb-${var.ENV}.${}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}

# The scope of a Route53 Zone is by default works in the default-vpc
# If you want DNS Resoutions should work in a specific VPC-x, you need to ensure that your Route53-zone is associated to VPC-x