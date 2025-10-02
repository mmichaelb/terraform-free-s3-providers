# Oracle Cloud Object Storage

Terraform module for creating S3-compatible storage on Oracle Cloud.

## Usage

```hcl
module "oracle" {
  source         = "github.com/mmichaelb/terraform-free-s3-providers/providers/oracle_cloud"
  bucket_name    = "my-bucket"
  compartment_id = "<compartment-id>"
  region         = "eu-frankfurt-1"
}

provider "oci" {
  tenancy_ocid     = "<tenancy-ocid>"
  user_ocid        = "<user-ocid>"
  fingerprint      = "<api key fingerprint>"
  private_key_path = "<path to api key private key>"
  region           = "eu-frankfurt-1"
}
```

## Credentials

You have to create an API key following this tutorial: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformproviderconfiguration.htm. 

Keep in mind that the user associated with the API key needs at least the following permissions (given using policies):

* `Allow group <your group> to manage all-resources in compartment <your compartment name>`
* `Allow group <your group> to manage users in tenancy where target.user.name = /<your bucket name>-*/`
* `Allow group <your group> to manage groups in tenancy where target.group.name = /<your bucket name>-*/`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >= 5.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_access_key"></a> [access\_key](#module\_access\_key) | ./access_key | n/a |
| <a name="module_management_key"></a> [management\_key](#module\_management\_key) | ./access_key | n/a |

## Resources

| Name | Type |
|------|------|
| [oci_objectstorage_bucket.bucket](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_identity_compartment.main](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/identity_compartment) | data source |
| [oci_objectstorage_namespace.general](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/objectstorage_namespace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_management_key"></a> [add\_management\_key](#input\_add\_management\_key) | Whether to add a management key to manage the bucket (list and delete). | `bool` | `false` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket to create. | `string` | n/a | yes |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The OCID of the compartment to create the bucket in. | `string` | n/a | yes |
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
| <a name="output_use_path_style"></a> [use\_path\_style](#output\_use\_path\_style) | n/a |
<!-- END_TF_DOCS -->
