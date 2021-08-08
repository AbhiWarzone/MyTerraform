resource "aws_vpc" "ntiervpc" {
    # cidr_block = "10.10.0.0/16"
      cidr_block = var.ntier_cidr
    tags = {
      "Name" = "ntier"
    }

} 

# depends on AWS VPC we create websubnet
resource "aws_subnet" "websubnet" {

    # cidr_block = "10.10.0.0/24"
    cidr_block = var.ntier_subnet_cidrs[0]
    # availability_zone = "us-west-2a"
    availability_zone = var.ntier_subnet_azs[0]
    tags = {
      "Name" = "ntier-web"
    }
    vpc_id = aws_vpc.ntiervpc.id

} 

resource "aws_subnet" "appsubnet" {
    # cidr_block = "10.10.1.0/24"
    cidr_block = var.ntier_subnet_cidrs[1]
    # availability_zone = "us-west-2a"
    availability_zone = var.ntier_subnet_azs[1]
    tags = {
      "Name" = "ntier-app"
    }
    vpc_id = aws_vpc.ntiervpc.id

}

resource "aws_subnet" "dbsubnet" {
  # cidr_block = "10.10.2.0/24"
  cidr_block = var.ntier_subnet_cidrs[2]
  # availability_zone = "us-west-2a"
  availability_zone = var.ntier_subnet_azs[2]
  tags = {
    "Name" = "ntier-db"
  }
  vpc_id = aws_vpc.ntiervpc.id

}

