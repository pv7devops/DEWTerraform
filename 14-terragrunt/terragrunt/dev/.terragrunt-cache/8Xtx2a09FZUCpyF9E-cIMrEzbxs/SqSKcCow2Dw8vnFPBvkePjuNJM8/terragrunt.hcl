terraform {
  source = "../../terraform/s3"
}

inputs = {
  region      = "us-east-1"
  bucket_name = "example-dev-bucket"
}
