data "oci_events_rules" "event_rules" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  display_name = each.value.resource
  state        = "ACTIVE"
}

resource "oci_logging_log" "ruleexecution_log" {
  for_each = var.logdefinition

  display_name = each.key
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "ruleexecutionlog"
      resource    = data.oci_events_rules.event_rules[each.key].rules.0.id
      service     = "cloudevents"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
