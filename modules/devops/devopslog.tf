data "oci_devops_projects" "devops_projects" {
  for_each       = var.logdefinition
  compartment_id = var.compartment_id

  name  = each.value.resource
  state = "ACTIVE"
}

resource "oci_logging_log" "devops_log" {


  for_each = var.logdefinition

  display_name = var.label_prefix == "none" ? each.key : format("%s-%s", var.label_prefix, each.key)
  log_group_id = var.loggroup[each.value.loggroup].id
  log_type     = "SERVICE"
  configuration {
    source {
      category    = "all"
      resource    = data.oci_devops_projects.devops_projects[each.key].project_collection[0]["items"].0.id
      service     = "devops"
      source_type = "OCISERVICE"
    }
  }

  is_enabled         = lookup(each.value, "enable", true)
  retention_duration = var.log_retention_duration

}
