# Additional Blocks

## Dynamic Block

### Dynamic "ingress"

- The dynamic block dynamically creates multiple ingress blocks based on the for_each value (var.ingress_rules).
- for_each = var.ingress_rules iterates over each ingress rule.
- Inside content, you define the attributes of each ingress block using ingress.value.

## Lifecycle block
    in Terraform, you can use the lifecycle block with the ignore_changes argument. This is helpful when you want Terraform to manage the security group but avoid overwriting certain attributes that may be changed outside Terraform (e.g., manual modifications in AWS).

### lifecycle Block:

The lifecycle block is part of a resource and defines how Terraform interacts with the resource's lifecycle.
### ignore_changes Attribute:

    Specifies which attributes Terraform should ignore when detecting changes during a plan or apply.
    For example, changes to ingress, egress, or tags made outside Terraform will not trigger updates.
### Attribute-Specific Ignore:

    You can target specific parts of a block, e.g.:
```hcl
lifecycle {
  ignore_changes = [
    ingress.cidr_blocks, # Only ignore changes to CIDR blocks in ingress
  ]
}

```
## Caveats
### Terraform Drift:
    Ignoring changes means Terraform will not detect or reconcile these changes, leading to potential configuration drift.
### Debugging Complexity:
    If ignored changes cause issues, they will not appear in the Terraform plan.
### Selective Ignoring:
    Use targeted ignoring (ingress.cidr_blocks) to reduce unintended effects.
