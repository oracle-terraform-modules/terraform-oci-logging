data "oci_email_email_domains" "email_domains" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  #id    = var.email_domain_id
  name  = each.value.resource
  state = "ACTIVE"
}

resource "oci_logging_log" "email_outboundaccepted_log" {


  for_each = var.logdefinition

  display_name = format("%s-%s", each.key, "accept")
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "outboundaccepted"
      resource    = data.oci_email_email_domains.email_domains[each.key].email_domain_collection[0]["items"].0.id
      service     = "emaildelivery"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "email_outboundrelayed_log" {
  for_each = var.logdefinition

  display_name = format("%s-%s", each.key, "relay")
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "outboundrelayed"
      resource    = data.oci_email_email_domains.email_domains[each.key].email_domain_collection[0]["items"].0.id
      service     = "emaildelivery"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
