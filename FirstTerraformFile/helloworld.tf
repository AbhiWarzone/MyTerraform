provider "aws" {
  region     = "us-west-2"
  profile   = "terraformcourse2"
}
//this is string variable

variable "firststring" {
    type = string
    default = "this is my first string"
}

variable "multilinestring" {
    type = string
    default = <<-EOT
    This is a multilinestring
    Welcome to terraform world
    EOT
}


output "myfirstoutput" {
    value = "${var.firststring}"
}

output "mymultilineoutput" {
    value = "${var.multilinestring}"
}

// This is my maps example

variable "mapexample" {
    type = map
    default = {
        "us-west" = "ami1"
    }
}

output "mapoutput" {
    value = "${var.mapexample["us-west"]}"
}

//This is array/list

variable "msecuritygrouplist" {
    type = list
    default = ["sg1", "sg2", "sg3"]
    }

output "sgoutput" {
    value = "${var.msecuritygrouplist}"
}

//This is boolean variable

variable "testbool" {
    default = true
}
output "booloutput"{
    value = "${var.testbool}"
}

//Input&output
variable "myInputVariable"{
    type = string
}

output "myOutputVaribale"{
    sensitive = true
    value = "${var.myInputVariable}"
}