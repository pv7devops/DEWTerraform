# Create an S3 bucket
resource "aws_s3_bucket" "my-s3-bucket" {
  bucket = "my-example-bucket"
}

# Create an IAM policy for the bucket
resource "aws_iam_policy" "example_policy" {
  name   = "example-policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:*",
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.example.id}",
          "arn:aws:s3:::${aws_s3_bucket.example.id}/*"
        ]
      }
    ]
  })

  # Explicitly define the dependency
  depends_on = [aws_s3_bucket.example]
}
