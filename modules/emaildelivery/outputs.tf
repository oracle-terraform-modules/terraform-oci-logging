#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "emaillogaccept_id" {
  value = { for v in oci_logging_log.email_outboundaccepted_log : v.display_name => v.id }
}

output "emaillogrelay_id" {
  value = { for v in oci_logging_log.email_outboundrelayed_log : v.display_name => v.id }
}

output "emailloggroup_id" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
