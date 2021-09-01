data "oci_load_balancer_load_balancers" "load_balancers" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  #detail       = var.load_balancer_detail
  display_name = each.value.resource
  state        = "ACTIVE"
}

resource "oci_logging_log" "lb_access_log" {


  for_each = var.logdefinition

  display_name = format("%s-%s", each.key, "access")
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

  display_name = format("%s-%s", each.key, "error")
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
