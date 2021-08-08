terraform {
    backend "remote" {
      organization = "warzone-learn"
      workspaces {
        name = "Example-Workspace"
      }
    }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-083ac7c7ecf9bb9b0"
  instance_type = "t2.micro"
}
