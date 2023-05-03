#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "os_readlogid" {
  value = { for v in oci_logging_log.os_read_log : v.display_name => v.id }
}

output "os_writelogid" {
  value = { for v in oci_logging_log.os_write_log : v.display_name => v.id }
}

output "os_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
