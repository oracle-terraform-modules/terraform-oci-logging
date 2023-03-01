output "mediaflow_executionlogid" {
  value = { for v in oci_logging_log.mediaflow_execution_log : v.display_name => v.id }
}

output "media_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
