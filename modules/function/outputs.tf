output "func_logid" {
  value = { for v in oci_logging_log.function_log : v.display_name => v.id }
}

output "func_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
