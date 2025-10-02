# Scaleway Object Storage

Terraform module for creating S3-compatible storage on Scaleway.

## Usage

```hcl
module "scaleway" {
  source          = "github.com/mmichaelb/terraform-free-s3-providers/providers/scaleway"
  bucket_name     = "my-bucket"
  project_id      = "<your project id>"
  region          = "fr-par"
}

provider "scaleway" {
  access_key      = "<your access key>"
  secret_key      = "<your secret key>"
  project_id      = "<your project id>"
  organization_id = "<your organization id>"
}
```

## Credentials

You have to create a new API key following this tutorial: https://www.scaleway.com/en/docs/identity-and-access-management/iam/how-to/create-api-keys/ (either a global API key for your whole account or using a pre-defined application bearer). Following that, the project and organization id have to be retrieved (https://www.scaleway.com/en/docs/identity-and-access-management/iam/concepts/#organization-id and https://www.scaleway.com/en/docs/console/my-project/concepts/#project).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.0 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | >=2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | >=2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_key"></a> [access\_key](#module\_access\_key) | ./access_key | n/a |
| <a name="module_management_key"></a> [management\_key](#module\_management\_key) | ./access_key | n/a |

## Resources

| Name | Type |
|------|------|
| [scaleway_object_bucket.bucket](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/object_bucket) | resource |
| [scaleway_object_bucket_acl.acl](https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/resources/object_bucket_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_management_key"></a> [add\_management\_key](#input\_add\_management\_key) | Whether to add a management key to manage the bucket (list and delete). | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to create. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The id of the project the infrastructure will be deployed in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which the bucket will be created (see https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/guides/regions_and_zones for more information). | `string` | n/a | yes |

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
| <a name="output_storage_class"></a> [storage\_class](#output\_storage\_class) | n/a |
<!-- END_TF_DOCS -->
