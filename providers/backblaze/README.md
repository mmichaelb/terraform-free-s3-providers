# Backblaze B2

Terraform module for creating S3-compatible storage on Backblaze B2.

## Usage

```hcl
module "backblaze_b2" {
  source      = "github.com/mmichaelb/terraform-free-s3-providers/providers/backblaze"
  bucket_name = "my-bucket"
}

provider "b2" {
  application_key_id = "<master_application_key_id>"
  application_key    = "<master_application_key>"
}
```

## Credentials

The master application key (id) can be retrieved from the Backblaze B2 web interface. For more information see https://www.backblaze.com/docs/cloud-storage-create-and-manage-app-keys.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_b2"></a> [b2](#requirement\_b2) | >= 0.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_b2"></a> [b2](#provider\_b2) | >= 0.8.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [b2_application_key.access](https://registry.terraform.io/providers/Backblaze/b2/latest/docs/resources/application_key) | resource |
| [b2_application_key.management](https://registry.terraform.io/providers/Backblaze/b2/latest/docs/resources/application_key) | resource |
| [b2_bucket.bucket](https://registry.terraform.io/providers/Backblaze/b2/latest/docs/resources/bucket) | resource |
| [b2_account_info.general](https://registry.terraform.io/providers/Backblaze/b2/latest/docs/data-sources/account_info) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_management_key"></a> [add\_management\_key](#input\_add\_management\_key) | Whether to add a management key to manage the bucket (list and delete). | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to create. | `string` | n/a | yes |
| <a name="input_override_retention_days"></a> [override\_retention\_days](#input\_override\_retention\_days) | The number of days to retain objects in the bucket. | `number` | `-1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_id"></a> [access\_key\_id](#output\_access\_key\_id) | n/a |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | n/a |
| <a name="output_endpoint_url"></a> [endpoint\_url](#output\_endpoint\_url) | n/a |
| <a name="output_management_access_key_id"></a> [management\_access\_key\_id](#output\_management\_access\_key\_id) | n/a |
| <a name="output_management_secret_access_key"></a> [management\_secret\_access\_key](#output\_management\_secret\_access\_key) | n/a |
| <a name="output_profile_name"></a> [profile\_name](#output\_profile\_name) | n/a |
| <a name="output_region"></a> [region](#output\_region) | n/a |
| <a name="output_secret_access_key"></a> [secret\_access\_key](#output\_secret\_access\_key) | n/a |
<!-- END_TF_DOCS -->
