# init >> validate >> plan >> apply >> destroy
terraform {
  required_version = ">= 1.9.8" # Adjust the version as per your requirement
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Adjust the version to match your needs
    }
  }
}

provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

