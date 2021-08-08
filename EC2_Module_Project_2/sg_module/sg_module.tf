// Security group creation
variable "vpcid" {
    type = string
    default = "vpc-91a393e9"
}
resource "aws_security_group" "terraform_ec2_sg_module" {
  name        = "terraform_ec2_sg_module"
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

// For out put 
output "sg_id_output" {
  value = "${aws_security_group.terraform_ec2_sg_module.id}"
}