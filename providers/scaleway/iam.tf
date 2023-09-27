module "access_key" {
  source      = "./access_key"
  access_verb = "access"
  bucket_name = var.bucket_name
  project_id  = var.project_id
  permissions = [
    "ObjectStorageObjectsWrite"
  ]
}

module "management_key" {
  count       = var.add_management_key ? 1 : 0
  source      = "./access_key"
  access_verb = "management"
  bucket_name = var.bucket_name
  project_id  = var.project_id
  permissions = [
    "ObjectStorageObjectsDelete",
    "ObjectStorageObjectsRead"
  ]
}
