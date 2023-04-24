output "apm_logid" {
  value = { for v in oci_logging_log.apm_log : v.display_name => v.id }
}

output "apm_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
