terraform {
  source = "../../terraform/s3"
}

inputs = {
  region      = "us-east-2"
  bucket_name = "example-prod-bucket"
}
