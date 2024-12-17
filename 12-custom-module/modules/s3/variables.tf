variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The ACL to apply to the bucket"
  type        = string
  default     = "private"
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = false
}

variable "enable_lifecycle_rule" {
  description = "Enable lifecycle rule for the bucket"
  type        = bool
  default     = false
}

variable "expiration_days" {
  description = "Number of days to retain objects before expiration"
  type        = number
  default     = 90
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  default     = {}
}

variable "bucket_policy" {
  description = "Optional bucket policy in JSON format"
  type        = string
  default     = null
}
