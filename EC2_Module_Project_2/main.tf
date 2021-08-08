// Use of module in terraform
provider "aws" {
   region    = "us-west-2"
   profile   = "terraformcourse2"
}
module "ec2_module_1" {
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2 Instance 1"
    source = "./ec2_module"
}

// Creating another Instance just for adding another module in main.tf  
module "ec2_module_2" {
    sg_id = "${module.sg_module.sg_id_output}"
    ec2_name = "EC2 Instance 2"
    source = "./ec2_module"
}

module "sg_module" {
    source = "./sg_module"
}