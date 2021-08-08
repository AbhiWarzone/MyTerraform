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
  # region = "us-west-2" 
  region = var.ntier_region
}
