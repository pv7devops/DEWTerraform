# # # Variable to define user names
# variable "iam_user_names" {
#   description = "List of IAM user names to create"
#   type        = list(string)
# #   default     = ["user1", "user2", "user3"] # Replace with your desired usernames
#   default     = ["user1", "user2", "user3"] # Replace with your desired usernames
# }

# # # Create IAM users
# # resource "aws_iam_user" "iam_users" {
# #   count = length(var.iam_user_names)

# #   name = var.iam_user_names[count.index]
# # }

# # # Output IAM user ARNs
# # output "iam_user_arns" {
# #   value = [for user in aws_iam_user.iam_users : user.arn]
# # }

# #====================================================================

# locals {
#   iam_user_map = { for user in var.iam_user_names : user => user }
# }

# # Create IAM users
# resource "aws_iam_user" "iam_users" {
#   for_each = local.iam_user_map

#   name = each.key
# }

# # Output IAM user ARNs
# output "iam_user_arns" {
#   value = { for name, user in aws_iam_user.iam_users : name => user.arn }
# }