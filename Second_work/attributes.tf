provider "aws" {
  region = "us-west-2"
  access_key = "AKIAVA2REOBJJKVJEPXP"
  secret_key = "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"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}

resource "aws_s3_bucket" "mys3" {
  bucket = "warzone-attribute-demo-001"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3.bucket_domain_name
}
