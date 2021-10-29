output "waf_logid" {
  value = { for v in oci_logging_log.waf_log : v.display_name => v.id }
}

output "waf_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
