output "int_logid" {
  value = { for v in oci_logging_log.integration_log : v.display_name => v.id }
}

output "int_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
