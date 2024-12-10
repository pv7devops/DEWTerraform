variable "nums" {
  description = "list of numbers"
  type        = list
  default = [10, 20, 30 , 40]
}

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, production)"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t3.micro"
}


variable "allowed_ips" {
  description = "List of IPs allowed to access the application"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {
    Owner       = "admin"
    Environment = "dev"
  }
}

variable "example_list" {
  type    = list(string)
  default = ["one", "two", "three"]
}

variable "example_map" {
  type    = map(string)
  default = {
    name  = "example"
    owner = "team"
  }
}

variable "example_set" {
  type    = set(string)
  default = ["apple", "banana", "cherry"]
}

variable "example_object" {
  type = object({
    name   = string
    age    = number
    active = bool
  })
  default = {
    name   = "John"
    age    = 30
    active = true
  }
}

variable "example_tuple" {
  type    = tuple([string, number, bool])
  default = ["example", 42, true]
}


variable "example_any" {
  type    = any
  default = "This can be any type"
}


variable "example_list_of_maps" {
  type = list(map(string))
  default = [
    { name = "server1", type = "t2.micro" },
    { name = "server2", type = "t2.small" }
  ]
}

variable "example_nested_object" {
  type = object({
    server = object({
      name = string
      type = string
    })
    tags = map(string)
  })
  default = {
    server = {
      name = "server1"
      type = "t2.micro"
    }
    tags = {
      environment = "dev"
      owner       = "admin"
    }
  }
}

