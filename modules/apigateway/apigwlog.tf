#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

data "oci_apigateway_deployments" "apigw_deployments" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  #Optional
  display_name = each.value.resource
  state        = "ACTIVE"
}


resource "oci_logging_log" "apigw_access_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "access", each.key) : format("%s-%s%s", var.label_prefix, "access", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "access"
      resource    = data.oci_apigateway_deployments.apigw_deployments[each.key].deployment_collection.0.id
      service     = "apigateway"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}

resource "oci_logging_log" "apigw_exec_log" {
  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "exec", each.key) : format("%s-%s%s", var.label_prefix, "exec", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "execution"
      resource    = data.oci_apigateway_deployments.apigw_deployments[each.key].deployment_collection.0.id
      service     = "apigateway"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
