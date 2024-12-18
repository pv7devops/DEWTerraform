variable "instance_configs" {
  default = [
    { name = "WebServer1", type = "t2.micro", ami = "ami-0c55b159cbfafe1f0" },
    { name = "WebServer2", type = "t2.small", ami = "ami-0c55b159cbfafe1f0" },
    { name = "WebServer3", type = "t3.micro", ami = "ami-0c55b159cbfafe1f0" }
  ]
}

resource "aws_instance" "web_servers" {
  count         = length(var.instance_configs)
  ami           = var.instance_configs[count.index].ami
  instance_type = var.instance_configs[count.index].type

  tags = {
    Name = var.instance_configs[count.index].name
  }
}
