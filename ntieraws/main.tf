#Terraform version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
#provider added
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "ntiervpc" {
    cidr_block = "10.10.0.0/16"

    tags = {
      "Name" = "ntier"
    }

} 

# depends on AWS VPC we create websubnet
resource "aws_subnet" "websubnet" {

    cidr_block = "10.10.0.0/24"
    availability_zone = "us-west-2a"
    tags = {
      "Name" = "ntier-web"
    }
    vpc_id = aws_vpc.ntiervpc.id

} 

resource "aws_subnet" "appsubnet" {
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-west-2a"
    tags = {
      "Name" = "ntier-app"
    }
    vpc_id = aws_vpc.ntiervpc.id

}

resource "aws_subnet" "dbsubnet" {
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-west-2a"
  tags = {
    "Name" = "ntier-db"
  }
  vpc_id = aws_vpc.ntiervpc.id

}

