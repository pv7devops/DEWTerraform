# Variables Precedence 

## Terraform TF vars file
The terraform.tfvars file is used in Terraform to define variables and assign default values for them. It allows you to separate configuration data (variable values) from the main Terraform configuration (.tf files). This makes your code more modular, reusable, and easier to manage across environments.

1. Explicit -var and -var-file flags in the command line.
2. terraform.tfvars or terraform.tfvars.json in the current directory.
3. Auto-loaded .auto.tfvars or .auto.tfvars.json files.
4. Environment variables with the prefix TF_VAR_.
5. Default values specified in the variable block.

```
terraform apply -var-file="production.tfvars"
```

## Best Practices
    - Environment-Specific Files: Use files like dev.tfvars, prod.tfvars, and specify them explicitly for different environments.
    - Avoid Hardcoding Sensitive Data: Use tools like HashiCorp Vault or AWS Secrets Manager for secure storage of sensitive information.
    - Commit Only Generic Files: Exclude sensitive or environment-specific .tfvars files from version control using .gitignore.