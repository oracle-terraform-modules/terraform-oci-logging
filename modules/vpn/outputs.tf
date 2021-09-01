output "vpn_logid" {
  value       = { for v in oci_logging_log.vpn_log : v.display_name => v.id }
  description = "VPN log id"
}

output "vpn_loggroupid" {
  value       = { for k, v in var.loggroup : v.display_name => v.id }
  description = "VPN loggroup id"
}
