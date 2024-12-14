variable "vpc_name" {
  type = string 
  default = "projVPC"
}

variable "vpc_cidr_block" {
  type = string 
  default = "10.0.0.0/16"
}

variable "vpc_availability_zones" {
  type = list(string)
  default = ["us-east-1a", "us-east-1b"]
}


variable "vpc_public_subnets" {
  type = list(string)
  default = ["10.0.10.0/24", "10.0.12.0/24"]
}

variable "vpc_private_subnets" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_enable_nat_gateway" {
  type = bool
  default = true  
}

variable "vpc_single_nat_gateway" {
  type = bool
  default = true
}

variable "vpc_enable_dns_hostnames" {
    type = bool
    default = true
}

variable "vpc_enable_dns_support" {
    type = bool
    default = true
}





