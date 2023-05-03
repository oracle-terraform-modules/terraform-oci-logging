#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

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
