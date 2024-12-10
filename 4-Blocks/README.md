# Terraform Settings Block
In Terraform, the settings block is used within a Terraform configuration to specify meta-configuration options that apply to the entire Terraform workspace. It is commonly found at the beginning of a .tf file.

    terraform {
    # Specifies the required Terraform version
    required_version = ">= 1.5.0"

    # Specifies required providers
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }

    # Backend configuration (optional)
    backend "s3" {
        bucket         = "my-terraform-state"
        key            = "global/s3/terraform.tfstate"
        region         = "us-west-2"
        dynamodb_table = "terraform-lock"
        encrypt        = true
    }
    }
1. required_version: Ensures the configuration only runs with specific versions of Terraform. Prevents breaking changes when used with incompatible Terraform versions.
### Example:

```
required_version = ">= 1.0.0, < 2.0.0"
```
2. required_providers: Defines which Terraform providers are needed and optionally locks their versions. Each provider must be fetched from the specified source

3. backend: Configures where Terraform stores the state file. Common backends include s3, azurerm, gcs, and local.

4. Experimental Features (Optional)
# Terraform Providers Block
The provider block in Terraform is used to configure provider settings. A provider is a plugin that interacts with APIs to manage resources, such as AWS, Azure, or Google Cloud.

```
provider "<PROVIDER_NAME>" {
  # Configuration options for the provider
  key1 = value1
  key2 = value2
}
```
# Terraform Resource Block
In Terraform, a resource block is used to define a specific infrastructure resource that you want to create, manage, or configure. 
```
resource "<PROVIDER>_<RESOURCE_TYPE>" "<RESOURCE_NAME>" {
# Arguments and configuration settings
key1 = value1
key2 = value2
# ...
}
```
- < PROVIDER>: The provider managing the resource (e.g., aws, azurerm, google).
- <RESOURCE_TYPE>: The specific type of resource (e.g., s3_bucket, instance).
- <RESOURCE_NAME>: A user-defined name for identifying the resource in your Terraform code.

### Example: AWS S3 Bucket
    resource "aws_s3_bucket" "example" {
    bucket = "my-example-bucket"
    acl    = "private"

    tags = {
        Environment = "Dev"
        Team        = "Llama"
    }
    }

### Example: EC2 Instance

    resource "aws_instance" "web" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"

    tags = {
        Name = "WebServer"
    }
    }

#### Key Points
- Resources are the building blocks of a Terraform configuration.
- You can use variables, locals, and data sources to make your resource configuration dynamic and reusable.
- Dependencies between resources are automatically managed by Terraform using interpolation (e.g., ${aws_instance.web.id}).