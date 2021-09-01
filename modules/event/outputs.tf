output "event_logid" {
  value = { for v in oci_logging_log.ruleexecution_log : v.display_name => v.id }
}

output "event_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
