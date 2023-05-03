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

module "vcn" {
  source = "./vcn"

  compartment_id = var.compartment_id
}

locals {
  vcn_id         = module.vcn.vcn_id
  subnet         = [module.vcn.subnetname]
  service_logdef = { for k in local.subnet : format("%s_%s", k, "log") => { loggroup = "testloggrp", service = "flowlogs", resource = k } }
}

module "logging" {
  source = "../../"

  # general oci parameters
  compartment_id         = var.compartment_id
  log_retention_duration = var.log_retention_duration
  service_logdef         = local.service_logdef
  loggroup_tags          = var.loggroup_tags
  vcn_id                 = local.vcn_id

  depends_on = [
    module.vcn
  ]

}
