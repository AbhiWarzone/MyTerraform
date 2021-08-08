variable "vpcid" {
    type = string
    default = "vpc-91a393e9"
}
resource "aws_security_group" "terraform_sg" {
  name        = "terraform_sg"
  description = "For Ec2 instance"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port        = 22   
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

// Add AMI for EC2 instance creation

variable "amiid" {
    default = "ami-083ac7c7ecf9bb9b0"
}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name   = "testkey"
  vpc_security_group_ids = ["${aws_security_group.terraform_sg.id}"]
  tags = { 
    Name = "Terraform Ec2 Instance"
  }
}
