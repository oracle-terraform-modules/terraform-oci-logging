output "linuxlogid" {
  value = { for v in oci_logging_log.linux_log : v.display_name => v.id }
}

output "windowslogid" {
  value = { for v in oci_logging_log.win_log : v.display_name => v.id }
}

output "linuxloggroupid" {
  value = { for k, v in var.linuxloggroup : v.display_name => v.id }
}

output "windowsloggroupid" {
  value = { for k, v in var.winloggroup : v.display_name => v.id }
}
