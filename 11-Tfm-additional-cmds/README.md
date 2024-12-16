# Terraform state
Terraform state commands are used to manage Terraform's state file, which tracks the current state of your infrastructure. Here's a breakdown of commonly used terraform state commands and their purposes:

1. List Resources in the State
```
terraform state list
```
    - Lists all resources in the current Terraform state.
    - Use case: Quickly see all the resources Terraform is managing.

2. Show Details of a Resource
```
terraform state show <RESOURCE_ADDRESS>
```
    - Displays detailed information about a specific resource in the state.

Example:
```
terraform state show 'aws_iam_user.iam_users["user1"]'
```

3. Example: Renaming a Resource
### Before Refactor
```
resource "aws_instance" "old_name" {
ami           = "ami-0c02fb55956c7d316"
instance_type = "t2.micro"
}
```
### After Refactor
Rename the resource from aws_instance.old_name to aws_instance.new_name in Terraform configuration:
```
resource "aws_instance" "new_name" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
}
```
### Steps to Rename
#### Run the State Move Command:
```
terraform state mv aws_instance.old_name aws_instance.new_name
```
## explicitly destroy a specific resource
```
terraform destroy -target=<RESOURCE_ADDRESS>

Ex: terraform destroy -target='aws_iam_user.iam_users["user1"]'
```

## Formatting
    terraform fmt

## Depends_on attribute
    The depends_on argument in Terraform is used to explicitly define dependencies between resources. This ensures that certain resources are created, updated, or destroyed only after their dependencies are fully handled, even when there is no implicit dependency based on resource references.

## JSON Encode
    The jsonencode function in Terraform is used to generate a properly formatted JSON string from a given Terraform data structure (like maps, lists, or objects). This is especially useful when working with resources that require JSON input, such as IAM policies, CloudFormation templates, or custom API payloads.
- Input:

    A Terraform map or object is passed to the jsonencode function.
    The structure includes Version, Statement, Action, Effect, and Resource, which are parts of an AWS IAM policy.
- Output:

    jsonencode converts this Terraform map into a JSON-formatted string. This is needed because the policy argument for the aws_iam_policy resource expects a valid JSON string.

 
