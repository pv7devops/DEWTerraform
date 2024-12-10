# Terraform syntax and code blocks
   Terrraform [syntax](https://developer.hashicorp.com/terraform/language/resources/syntax) has following components
   1. Block Type - Ex: Resource, Data Block etc..,
      - Settings Block
      - Provider Block
      - Data Block
      - Resource Block
      - Locals Block
      - Modules Block
      - Variables Block
      - Outputs Block
   2. Block Label - Ex: aws_s3_bucket
   3. Body 
      - Identifier - Required/Optional
      - Expression
   4. MetaArguments - changes the resoruce behaviour and not part of resource block. Ex: count, for_each
   
   ![Terraform syntax](../images/terrafrom-syntax-1.jpg)
   
   Documentation for terraform providers and modules. [Terraform Providers](https://developer.hashicorp.com/terraform/language/providers)
   