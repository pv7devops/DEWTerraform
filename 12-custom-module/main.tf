module "s3_bucket" {
  source                = "./modules/s3"
  bucket_name           = "my-acl-updated-s3-bucket"
  acl                   = "private"
  enable_versioning     = true
  enable_lifecycle_rule = true
  expiration_days       = 30
  tags = {
    Environment = "Staging"
    Project     = "ACLUpdate"
  }
}

output "s3_bucket_arn" {
  value = module.s3_bucket.bucket_arn
}

output "s3_bucket_name" {
  value = module.s3_bucket.bucket_name
}
