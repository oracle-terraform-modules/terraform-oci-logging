resource "oci_logging_log" "os_read_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "read", each.key) : format("%s-%s%s", var.label_prefix, "read", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "read"
      resource    = each.value.resource
      service     = "objectstorage"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "os_write_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "write", each.key) : format("%s-%s%s", var.label_prefix, "write", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "write"
      resource    = each.value.resource
      service     = "objectstorage"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
