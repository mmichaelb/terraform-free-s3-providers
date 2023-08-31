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