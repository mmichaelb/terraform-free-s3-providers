variable "bucket_name" {
  type        = string
  description = "The name of the bucket to create."
}

variable "override_retention_days" {
  type        = number
  description = "The number of days to retain objects in the bucket."
  default     = -1
}

variable "add_management_key" {
  type        = bool
  description = "Whether to add a management key to manage the bucket (list and delete)."
  default     = false
}
