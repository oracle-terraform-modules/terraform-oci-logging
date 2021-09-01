resource "oci_logging_log" "os_read_log" {


  for_each = var.logdefinition

  display_name = format("%s-%s", each.key, "read")
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

  display_name = format("%s-%s", each.key, "write")
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
