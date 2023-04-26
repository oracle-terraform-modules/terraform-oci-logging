#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.67.3"
    }
  }
}

resource "oci_objectstorage_bucket" "test_bucket" {
  #Required
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
}

locals {
  bucket_name = oci_objectstorage_bucket.test_bucket.name
  service_logdef = {
    objectlog = { loggroup = "testloggroup", service = "objectstorage", resource = local.bucket_name }
  }
}

module "logging" {
  source = "../../"

  compartment_id         = var.compartment_id
  log_retention_duration = var.log_retention_duration
  service_logdef         = local.service_logdef
  loggroup_tags          = var.loggroup_tags

}
