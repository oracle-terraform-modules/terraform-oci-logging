#Copyright (c) 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "analyticscloud_auditlogid" {
  value = { for v in oci_logging_log.analyticscloud_audit_log : v.display_name => v.id }
}

output "analyticscloud_diaglogid" {
  value = { for v in oci_logging_log.analyticscloud_diag_log : v.display_name => v.id }
}

output "analyticscloud_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
