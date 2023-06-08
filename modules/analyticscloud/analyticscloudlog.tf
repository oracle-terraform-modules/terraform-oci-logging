#Copyright (c) 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_analytics_analytics_instances" "analyticscloud" {
  for_each = var.logdefinition

  compartment_id = var.compartment_id

  name  = each.value.resource
  state = "ACTIVE"
}


resource "oci_logging_log" "analyticscloud_audit_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "audit", each.key) : format("%s-%s%s", var.label_prefix, "access", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "audit"
      resource    = data.oci_analytics_analytics_instances.analyticscloud[each.key].analytics_instances.0.id
      service     = "oacnativeproduction"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "analyticscloud_diag_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "diagnostic", each.key) : format("%s-%s%s", var.label_prefix, "exec", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "diagnostic"
      resource    = data.oci_analytics_analytics_instances.analyticscloud[each.key].analytics_instances.0.id
      service     = "oacnativeproduction"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
