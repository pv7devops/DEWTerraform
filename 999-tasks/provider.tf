variable "allowed_ports" {
  default = [22, 80, 443] # SSH, HTTP, HTTPS
}
variable "allowed_ports_new" {
  default = { "ssh" = 22,
    "http" = 80,
  "https" = 443 }

}
resource "aws_security_group" "example" {
  name = "dynamic-sg"

  dynamic "ingress" {
    for_each = var.allowed_ports_new
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
