locals {
  logdef   = { for k, v in var.linux_logdef : k => v }
  loggroup = [for k, v in var.linux_logdef : v.loggroup]
}

locals {
  winlogdef   = { for k, v in var.windows_logdef : k => v }
  winloggroup = [for k, v in var.windows_logdef : v.loggroup]
}

#agent configuration for linux logs
resource "oci_logging_unified_agent_configuration" "linux_unified_agent_configuration" {
  for_each = local.logdef

  compartment_id = var.compartment_id
  is_enabled     = true
  description    = format("%s-%s", "agentconfig", each.key)
  display_name   = format("%s-%s", "agentconfig", each.key)
  service_configuration {

    configuration_type = "LOGGING"

    #Optional
    destination {

      log_object_id = oci_logging_log.linux_log[each.key].id
    }
    sources {

      source_type = "LOG_TAIL"
      paths       = each.value.path
      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "NONE" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "NONE")
        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "SYSLOG" ? [1] : []

        content {
          parser_type        = lookup(each.value, "parser", "SYSLOG")
          rfc5424time_format = ""
          syslog_parser_type = ""

        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "CSV" || lookup(each.value, "parser", "NONE") == "TSV" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "CSV")
          keys        = []
          delimiter   = ","
        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "REGEXP" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "REGEXP")
          expression  = ".*"
          time_format = ""
        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "MULTILINE" ? [1] : []

        content {
          parser_type      = lookup(each.value, "parser", "MULTILINE")
          format           = ""
          format_firstline = ""
        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "APACHE_ERROR" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "APACHE_ERROR")

        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "APACHE2" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "APACHE2")

        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "AUDITD" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "AUDITD")

        }
      }

      dynamic "parser" {
        for_each = lookup(each.value, "parser", "NONE") == "JSON" ? [1] : []

        content {
          parser_type = lookup(each.value, "parser", "JSON")
          time_type   = "UNIXTIME"

        }
      }

      name = each.key
    }
  }

  group_association {
    group_list = [data.oci_identity_dynamic_groups.linux_dynamic_groups[each.key].dynamic_groups.0.id]
  }
}

#windowslog
resource "oci_logging_unified_agent_configuration" "windows_unified_agent_configuration" {
  for_each = local.winlogdef

  compartment_id = var.compartment_id
  is_enabled     = true
  description    = format("%s-%s", "agentconfig", each.key)
  display_name   = format("%s-%s", "agentconfig", each.key)
  service_configuration {

    configuration_type = "LOGGING"

    #Optional
    destination {

      log_object_id = oci_logging_log.win_log[each.key].id
    }
    sources {


      source_type = "WINDOWS_EVENT_LOG"

      #Optional
      channels = lookup(each.value, "channel", ["Application"])
      name     = each.key
    }

  }
  #Optional
  #   defined_tags = {
  #     "${oci_identity_tag_namespace.tag-namespace1.name}.${oci_identity_tag.tag1.name}" = var.log_group_defined_tags_value
  #   }

  #   freeform_tags = var.unified_agent_configuration_freeform_tags
  group_association {

    #Optional
    group_list = [data.oci_identity_dynamic_groups.win_dynamic_groups[each.key].dynamic_groups.0.id]
  }

}


resource "oci_logging_log" "linux_log" {


  for_each = local.logdef

  display_name       = each.key
  log_group_id       = var.linuxloggroup[each.value.loggroup].id
  log_type           = "CUSTOM"
  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "win_log" {


  for_each = local.winlogdef

  display_name       = each.key
  log_group_id       = var.winloggroup[each.value.loggroup].id
  log_type           = "CUSTOM"
  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

data "oci_identity_dynamic_groups" "linux_dynamic_groups" {

  for_each       = local.logdef
  compartment_id = var.tenancy_id

  #Optional
  name  = each.value.dg
  state = "ACTIVE"
}

data "oci_identity_dynamic_groups" "win_dynamic_groups" {

  for_each       = local.winlogdef
  compartment_id = var.tenancy_id

  #Optional
  name  = each.value.dg
  state = "ACTIVE"
}
