#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_core_ipsec_connections" "ip_sec_connections" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id
  filter {
    name   = "display_name"
    values = [each.value.resource]
  }

}

resource "oci_logging_log" "vpn_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "read"
      resource    = data.oci_core_ipsec_connections.ip_sec_connections[each.key].connections.0.id
      service     = "oci_c3_vpn"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
