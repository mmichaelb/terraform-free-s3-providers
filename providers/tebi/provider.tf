locals {
  endpoint_url = "s3.tebi.io"
  region       = "us-east-1"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  endpoints {
    s3 = "https://${local.endpoint_url}"
  }
  region                      = local.region
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
