provider "aws" {
  region = var.region
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

output "bucket_arn" {
  value = aws_s3_bucket.example.arn
}
