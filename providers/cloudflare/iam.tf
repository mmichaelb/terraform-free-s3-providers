data "cloudflare_api_token_permission_groups_list" "all" {}

locals {
  workers_r2_storage_bucket_item_write = data.cloudflare_api_token_permission_groups_list.all.result[index(
      data.cloudflare_api_token_permission_groups_list.all.result.*.name,
      "Workers R2 Storage Bucket Item Write"
    )]
  workers_r2_storage_bucket_item_read = data.cloudflare_api_token_permission_groups_list.all.result[index(
      data.cloudflare_api_token_permission_groups_list.all.result.*.name,
      "Workers R2 Storage Bucket Item Read"
    )]
}

resource "cloudflare_api_token" "access" {
  name = "${var.bucket_name}-access"
  policies = [{
    effect = "allow"
    permission_groups = [
      {
        id = local.workers_r2_storage_bucket_item_write.id
      }
    ]
    resources = {
      "com.cloudflare.edge.r2.bucket.${var.account_id}_default_${var.bucket_name}" = "*"
    }
  }]
}

resource "cloudflare_api_token" "management" {
  count = var.add_management_key ? 1 : 0
  name  = "${var.bucket_name}-management"
  policies = [{
    effect = "allow"
    permission_groups = [
      {
        id = local.workers_r2_storage_bucket_item_write.id
      },
      {
        id = local.workers_r2_storage_bucket_item_read.id
      }
    ]
    resources = {
      "com.cloudflare.edge.r2.bucket.${var.account_id}_default_${var.bucket_name}" = "*"
    }
  }]
}
