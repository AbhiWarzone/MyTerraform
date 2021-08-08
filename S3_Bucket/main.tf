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
  access_key = "Your Access key provide by (IAM USER)"
  secret_key = "Your Secret Key provide by AWS(IAM USER)"
}

# Resource for s3

  resource "aws_s3_bucket" "my_bucket" {
      bucket = "wzs3fromtf"
  
  }