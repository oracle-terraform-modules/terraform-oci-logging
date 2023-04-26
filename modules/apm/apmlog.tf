#Copyright (c) 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_apm_apm_domains" "apm_domains" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "ACTIVE"
}

resource "oci_logging_log" "apm_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "dropped-data"
      resource    = data.oci_apm_apm_domains.apm_domains[each.key].apm_domains[0].id
      service     = "apm"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
