# Cloudflare R2

Terraform module for creating S3-compatible storage on Cloudflare R2.

## Usage

```hcl
module "cloudflare" {
  source      = "github.com/mmichaelb/terraform-free-s3-providers/providers/cloudflare"
  bucket_name = "my-bucket"
  account_id  = "<your account id>"
  region      = "WEUR"
}

provider "cloudflare" {
  api_token = "<your api key>"
}
```

## Credentials

You have to create a new API token following this tutorial: https://developers.cloudflare.com/fundamentals/api/get-started/create-token/. You have to **select the template "Create Additional Tokens"** in order for the token to be usable. The token needs the following permissions:

* User's Account - `Workers R2 Storage:Edit`
* All users - `API Tokens:Edit`

Furthermore, you need to retrieve the account id of your account (the account, the Bucket should be created in). See this tutorial for further assistance: https://developers.cloudflare.com/fundamentals/setup/find-account-and-zone-ids/

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_api_token.access](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token) | resource |
| [cloudflare_api_token.management](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/api_token) | resource |
| [cloudflare_r2_bucket.bucket](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/r2_bucket) | resource |
| [cloudflare_api_token_permission_groups_list.all](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/api_token_permission_groups_list) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | The ID of the account that the bucket will be created in (see https://developers.cloudflare.com/fundamentals/setup/find-account-and-zone-ids/). | `string` | n/a | yes |
| <a name="input_add_management_key"></a> [add\_management\_key](#input\_add\_management\_key) | Whether to add a management key to manage the bucket (list and delete). | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to create. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to create the bucket in. | `string` | n/a | yes |

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
