# resource "aws_s3_bucket" "example" {
#   bucket = "myownbucketindec"
# }

variable "bucket_name" {
  default = "myownbktfromvariable"  
}
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

output "s3_details" {
  value = aws_s3_bucket.example.arn
}
#==========================================================================
# variable "bucket_names" {
#   description = "Bucket name"
#   default = ["myfirstbucketin20241", "myfirstbucketin20242"]
  
# }

# resource "aws_s3_bucket" "example" {
#   count = 2
#   bucket = var.bucket_names[count.index]
# }

# output "bucket_names_op" {
#   value = [for bkt in aws_s3_bucket.example: bkt.id]
# } 

# output "bucket_names_using_splat" {
#   value = aws_s3_bucket.example[*].id
# }

# output "bucket_names_map_adv" {
#   value = {for num, bkt in aws_s3_bucket.example: num => bkt.id}
# }

#================================================================================
# variable "env" {
#   default = "dev"
# }

# variable "bucket_name" {
#   type = map(string)
#   default = {
#     dev = "devenv"
#     prod = "prodenv"
#   }
  
# }
# resource "aws_s3_bucket" "example" {
#   # count = 2
#   bucket = "bucketnamein2024${var.bucket_name[var.env]}"
# }

# output "s3_details" {
#   value = aws_s3_bucket.example.arn
# }
