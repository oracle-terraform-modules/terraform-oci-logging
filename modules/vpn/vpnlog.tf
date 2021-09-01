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

  display_name = each.key
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
