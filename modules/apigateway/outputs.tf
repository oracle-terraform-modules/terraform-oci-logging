#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "apigw_accesslogid" {
  value = { for v in oci_logging_log.apigw_access_log : v.display_name => v.id }
}

output "apigw_execlogid" {
  value = { for v in oci_logging_log.apigw_exec_log : v.display_name => v.id }
}

output "apigw_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
