output "emaillogaccept_id" {
  value = { for v in oci_logging_log.email_outboundaccepted_log : v.display_name => v.id }
}

output "emaillogrelay_id" {
  value = { for v in oci_logging_log.email_outboundrelayed_log : v.display_name => v.id }
}

output "emailloggroup_id" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
