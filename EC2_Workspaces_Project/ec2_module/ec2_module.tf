

// Add AMI for EC2 instance creation

variable "amiid" {
    default = "ami-083ac7c7ecf9bb9b0"
}

variable "sg_id" {}  
variable "ec2_name" {}

// Ec2 Instance creation
resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name   = "testkey"
  vpc_security_group_ids = ["${var.sg_id}"]
  tags = { 
    Name = "${var.ec2_name}"
  }
}
