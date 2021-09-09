data "oci_load_balancer_load_balancers" "load_balancers" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "ACTIVE"
}

resource "oci_logging_log" "lb_access_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "access", each.key) : format("%s-%s%s", var.label_prefix, "access", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "access"
      resource    = data.oci_load_balancer_load_balancers.load_balancers[each.key].load_balancers.0.id
      service     = "loadbalancer"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "lb_error_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "error", each.key) : format("%s-%s%s", var.label_prefix, "error", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "error"
      resource    = data.oci_load_balancer_load_balancers.load_balancers[each.key].load_balancers.0.id
      service     = "loadbalancer"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
