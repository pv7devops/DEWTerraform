resource "aws_iam_user" "example" {
  count = length(var.iam_user_names)  # Count is based on the number of items in the list

  name = var.iam_user_names[count.index]  # Dynamically assign each username
                      # Optional: Path for the user

  tags = {
    Name = var.iam_user_names[count.index]
    Environment = "Production"
  }
}
