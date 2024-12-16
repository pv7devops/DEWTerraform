# PROVISIONERS

Terraform provisioners are a mechanism for executing scripts or performing actions on a resource after it has been created or modified. Provisioners are often used for tasks like software installation, configuration, or custom setup that cannot be handled by the infrastructure resource definition itself. However, they are considered a last resort by HashiCorp and should be avoided whenever possible in favor of more declarative methods like configuration management tools (e.g., Ansible, Chef, Puppet) or cloud-init scripts.

## Types of Provisioners
### File Provisioner
Transfers files from the local machine to a remote resource.
#### Example:
```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
}
```
### Local-Exec Provisioner
Executes commands on the machine where Terraform is running.
#### Example:
```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ips.txt"
  }
}
```
### Remote-Exec Provisioner
Executes commands on the remote resource via SSH or WinRM.
#### Example:
```
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}
```
## When to Use Provisioners
- As a last resort for tasks that cannot be accomplished using Terraform's declarative syntax.
- To run tasks during initial resource creation or during destruction.
For lightweight tasks, such as sending notifications or minor configuration changes.
### Avoiding Provisioners
Provisioners introduce complexity and can lead to non-declarative behavior. To minimize their use:

- Use cloud-init scripts for instance configuration.
- Rely on configuration management tools (e.g., Ansible).
- Use native Terraform features (e.g., user_data for AWS EC2).
### Managing Provisioner Behavior
- When Creation Fails Use the on_failure setting to control what happens if a provisioner fails:
    - continue: Ignore errors and continue.
    - fail: Stop execution if the provisioner fails.

```
provisioner "remote-exec" {
  on_failure = "continue"
  inline = ["some-command"]
}
```
Destroy-Time Provisioners Run actions during resource destruction using the when = "destroy" setting:
```
provisioner "local-exec" {
  when    = "destroy"
  command = "echo Resource is being destroyed!"
}
```
## Best Practices
- Avoid using provisioners unless absolutely necessary.
- Document their use and ensure the commands are idempotent.
- Use provisioners for transitional tasks, not for long-term resource management.