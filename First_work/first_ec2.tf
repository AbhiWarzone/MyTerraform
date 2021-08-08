provider "aws" {
  region = "us-west-2"
  access_key = "AKIAVA2REOBJJKVJEPXP"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-083ac7c7ecf9bb9b0"
    instance_type = "t2.micro"
}