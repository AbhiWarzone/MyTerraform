provider "aws" {
  region = "us-west-2"
  access_key = "AKIAVA2REOBJJKVJEPXP"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-083ac7c7ecf9bb9b0"
    instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}


resource "aws_security_group" "allow_tls" {
  name        = "warzone-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

#    cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}
