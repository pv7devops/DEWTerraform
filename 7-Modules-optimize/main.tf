# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" 
  version = "5.4.0"

  name = var.vpc_name
  cidr = var.vpc_cidr_block  
  azs                 = var.vpc_availability_zones
  public_subnets      = var.vpc_public_subnets
  private_subnets     = var.vpc_private_subnets
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  enable_dns_support = var.vpc_enable_dns_support
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  public_subnet_tags = {
    name = "pub-subnets"
  }

  private_subnet_tags = {
    name = "priv-subnets"
  }

  tags = {
    Owner = "ava"
    env = "stag"
  }

  vpc_tags = {
    Name = "vpc-stag"
  }
  map_public_ip_on_launch = true
}