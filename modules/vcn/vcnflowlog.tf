#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

resource "oci_logging_log" "vcn_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "all"
      resource    = var.vcn_id == "none" ? data.oci_core_subnets.withoutvcn[each.key].subnets.0.id : data.oci_core_subnets.withvcn[each.key].subnets.0.id
      service     = "flowlogs"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

data "oci_core_subnets" "withvcn" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "AVAILABLE"
  vcn_id       = var.vcn_id
}

data "oci_core_subnets" "withoutvcn" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "AVAILABLE"

}
