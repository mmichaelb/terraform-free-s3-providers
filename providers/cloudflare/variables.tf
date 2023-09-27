variable "account_id" {
  type        = string
  description = "The ID of the account that the bucket will be created in (see https://developers.cloudflare.com/fundamentals/setup/find-account-and-zone-ids/)."
}
variable "bucket_name" {
  type        = string
  description = "The name of the bucket to create."
}
variable "region" {
  type        = string
  description = "The region to create the bucket in."
}

variable "add_management_key" {
  type        = bool
  description = "Whether to add a management key to manage the bucket (list and delete)."
  default     = false
}
