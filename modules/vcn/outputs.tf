output "vcn_logid" {
  value = { for k, v in oci_logging_log.vcn_log : v.display_name => v.id }
}

output "vcn_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
