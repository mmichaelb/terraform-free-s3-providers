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
