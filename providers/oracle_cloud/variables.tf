variable "bucket_name" {
  type        = string
  description = "The name of the bucket to create."
}
variable "region" {
  type        = string
  description = "The region to create the bucket in."
}
variable "compartment_id" {
  type        = string
  description = "The OCID of the compartment to create the bucket in."
}

variable "add_management_key" {
  type        = bool
  description = "Whether to add a management key to manage the bucket (list and delete)."
  default     = false
}
