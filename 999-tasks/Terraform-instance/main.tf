resource "aws_instance" "example" {
  # Create an instance in each availability zone
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "var.inst"
 # Place instance in the correct AZ
}

