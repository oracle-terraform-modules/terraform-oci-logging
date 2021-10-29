data "oci_waf_web_app_firewalls" "web_app_firewalls" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  display_name = each.value.resource
  state        = ["ACTIVE"]
  #web_app_firewall_policy_id = oci_waf_web_app_firewall_policy.test_web_app_firewall_policy.id
}

resource "oci_logging_log" "waf_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "all"
      resource    = data.oci_waf_web_app_firewalls.web_app_firewalls[each.key].web_app_firewall_collection[0]["items"].0.id
      service     = "waf"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
