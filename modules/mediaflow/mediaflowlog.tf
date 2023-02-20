data "oci_media_services_media_workflows" "media_workflows" {

  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  display_name = each.value.resource
  state        = "ACTIVE"
}



resource "oci_logging_log" "mediaflow_execution_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? format("%s%s", "execution", each.key) : format("%s-%s%s", var.label_prefix, "execution", each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "execution"
      resource    = data.oci_media_services_media_workflows.media_workflows[each.key].media_workflow_collection[0]["items"].0.id
      service     = "mediaflow"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
