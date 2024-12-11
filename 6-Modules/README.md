# Terraform Modules
modules [reference](https://registry.terraform.io/browse/modules)

A module in Terraform is a container for multiple resources that are used together to create a logical unit. Modules help organize your configuration, promote reusability, and simplify management, especially in complex projects.

## Structure of a Module
A Terraform module typically consists of:
- Input Variables: Parameters to customize the module's behavior.
- Resources: The core infrastructure resources defined in the module.
- Outputs: Values that the module returns to the calling configuration.

#### Example Directory Structure for a Module
```
my-module/
├── main.tf         # Core configuration
├── variables.tf    # Input variable definitions
├── outputs.tf      # Output definitions
├── README.md       # Optional documentation

```

## Example: Simple AWS EC2 Module
### Module: modules/ec2-instance
#### main.tf

```
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}
```
#### variables.tf
```
variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2"
  type        = string
  default     = "t2.micro"
}

variable "name" {
  description = "Name tag for the instance"
  type        = string
}

```
#### outputs.tf
```
output "instance_id" {
  description = "ID of the created instance"
  value       = aws_instance.example.id
}
```

## using the module
```
module "example_ec2" {
  source         = "./modules/ec2-instance"
  ami            = "ami-0c55b159cbfafe1f0"
  instance_type  = "t2.medium"
  name           = "example-instance"
}
```

## Public Modules: Terraform Registry
Terraform Registry offers pre-built modules for common tasks.

### Example: Using the AWS VPC Module

```
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "example-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
```

## Types of Modules
### Root Module:
The main Terraform configuration that is executed.
Every Terraform configuration is a root module.
### Child Module:
A module called by another module, typically located in a separate directory or fetched remotely.

### Best Practices for Modules
#### Write Generic Modules:
- Avoid hardcoding values; use variables to make modules reusable.
#### Document Modules:
- Include a README.md to explain usage, variables, and outputs.
#### Version Control:
- Use version constraints for remote modules to avoid breaking changes.
#### Output Key Information:
- Use outputs to expose necessary details to the calling module.

