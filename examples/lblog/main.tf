terraform {
  required_version = ">= 1.0.0"
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = ">=4.38.0"
    }
  }
}

locals {
  lbname = var.lbname
  service_logdef = {
    lblog = { loggroup = "testloggroup", service = "loadbalancer", resource = local.lbname }
  }
}

module "logging" {
  source = "../../"

  compartment_id         = var.compartment_id
  log_retention_duration = var.log_retention_duration
  service_logdef         = local.service_logdef
  loggroup_tags          = var.loggroup_tags

}
