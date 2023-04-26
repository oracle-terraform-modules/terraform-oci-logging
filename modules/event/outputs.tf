#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

output "event_logid" {
  value = { for v in oci_logging_log.ruleexecution_log : v.display_name => v.id }
}

output "event_loggroupid" {
  value = { for k, v in var.loggroup : v.display_name => v.id }
}
