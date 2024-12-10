# Primitive Data Types

### String
Represents a sequence of characters.  
Example:
```hcl
variable "example_string" {
  type    = string
  default = "Hello, Terraform!"
}
```
### Number
Represents numeric values, including integers and floating-point numbers.
Example:

```language
variable "example_number" {
  type    = number
  default = 42
}
```
### Bool
Represents a boolean value (true or false).
Example:

```language
variable "example_bool" {
  type    = bool
  default = true
}
```
## Complex Data Types
### List

Represents an ordered collection of values of the same type.
Example:

```language
variable "example_list" {
  type    = list(string)
  default = ["one", "two", "three"]
}
```
### Map
Represents a collection of key-value pairs where the keys are strings, and values can be of any type.
Example:

```language
variable "example_map" {
  type    = map(string)
  default = {
    name  = "example"
    owner = "team"
  }
}
```
### Set

Represents an unordered collection of unique values of the same type.
Example:

```language
variable "example_set" {
  type    = set(string)
  default = ["apple", "banana", "cherry"]
}
```
### Object
Represents a collection of named attributes, each with its own type.
Example:

```language
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
```
### Tuple

Represents a fixed-length sequence of values, potentially of different types.
Example:

```language
variable "example_tuple" {
  type    = tuple([string, number, bool])
  default = ["example", 42, true]
}
```
## Dynamic Types
### Any
Represents any type of value, useful when the type isn't fixed.
Example:

```language
variable "example_any" {
  type    = any
  default = "This can be any type"
}
```
## Type Constraints
You can combine and constrain types for more complex use cases:

### Lists of Maps
```language
variable "example_list_of_maps" {
  type = list(map(string))
  default = [
    { name = "server1", type = "t2.micro" },
    { name = "server2", type = "t2.small" }
  ]
}
```
### Objects with Nested Types
```language
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
```
## Usage in Expressions
### Accessing data:
```language
output "example_output" {
  value = var.example_list[0] # Access the first item in a list
}

Iterating over collections:
locals {
  uppercase_names = [for name in var.example_list : upper(name)]
}
```

### type() function
    to determine the data type of a variable or expression

### Default value not present
    it will prompt to enter value for the variable during run time.

### Terraform template
    1. 


