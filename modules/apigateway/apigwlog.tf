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
