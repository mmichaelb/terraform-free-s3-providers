variable "bucket_name" {
  type = string
}

variable "access_verb" {
  type = string
}

variable "oci_identity_compartment" {
  type = any
}

variable "permissions" {
  type = list(string)
}
