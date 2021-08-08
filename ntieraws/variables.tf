variable "ntier_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "ntier_region" {
    type = string
    default = "us-west-2"
} 

variable "ntier_subnet_cidrs" {
    type = list(string)
    default = [ "10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24" ]
}

variable "ntier_subnet_azs" {
    # type = string
    default = ["us-west-2a", "us-west-2a", "us-west-2a"]
  
}