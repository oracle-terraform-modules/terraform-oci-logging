#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_integration_integration_instances" "integration_instances" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  display_name = each.value.resource
  state        = "ACTIVE"
}

resource "oci_logging_log" "integration_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "activitystream"
      resource    = data.oci_integration_integration_instances.integration_instances[each.key].integration_instances.0.id
      service     = "integration"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
