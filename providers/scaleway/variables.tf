variable "project_id" {
  type        = string
  description = "The id of the project the infrastructure will be deployed in."
}
variable "bucket_name" {
  type        = string
  description = "The name of the bucket to create."
}
variable "region" {
  type        = string
  description = "The region in which the bucket will be created (see https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/guides/regions_and_zones for more information)."
}

variable "add_management_key" {
  type        = bool
  description = "Whether to add a management key to manage the bucket (list and delete)."
  default     = false
}
