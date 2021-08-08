provider "aws" {
   region    = "us-west-2"
   profile   = "terraformcourse2"
}
module "ec2_module" {
    source = "./ec2_module"
}