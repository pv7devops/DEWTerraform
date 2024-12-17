# Install Terragrunt
- Download Terragrunt:

    - Visit the Terragrunt GitHub releases page.
    - Download the latest Windows binary.
- Install Terragrunt:
    - Move the terragrunt.exe file to a directory like C:\Terragrunt.
    - Add this directory to your PATH.
- Verify Installation:
```
terragrunt version
```

terragrunt-demo/
├── terraform/
│   └── s3/
│       ├── main.tf
│       ├── variables.tf
├── terragrunt/
    ├── dev/
    │   └── terragrunt.hcl
    ├── prod/
        └── terragrunt.hcl


## Run Terragrunt
- Navigate to the Environment Folder: Open a terminal and move to the dev or prod folder:
```
cd path\to\terragrunt\dev
```
- Initialize and Apply:
```
terragrunt init
```
- Apply
```
Apply
```
## Benefits of Using Terragrunt
- Centralized Terraform code with environment-specific inputs.
- Simplifies managing remote state and dependencies between modules.
- Enables consistent workflows across environments.

## Install/Uninstall terragrunt using choco