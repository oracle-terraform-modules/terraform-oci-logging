#APIGateway loggroup resource
resource "oci_logging_log_group" "apigwloggroup" {

  for_each = toset(local.apigwloggroup)

  compartment_id = var.compartment_id
  description    = "API Gateway Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Devops loggroup
resource "oci_logging_log_group" "devopsloggroup" {

  for_each = toset(local.devopsloggroup)

  compartment_id = var.compartment_id
  description    = "Devops Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Email delivery loggroup resource
resource "oci_logging_log_group" "emailloggroup" {

  for_each = toset(local.emailloggroup)

  compartment_id = var.compartment_id
  description    = "Email Delivery Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Event Service loggroup resource
resource "oci_logging_log_group" "eventloggroup" {

  for_each = toset(local.eventloggroup)

  compartment_id = var.compartment_id
  description    = "Events Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Function loggroup resource
resource "oci_logging_log_group" "funcloggroup" {

  for_each = toset(local.funcloggroup)

  compartment_id = var.compartment_id
  description    = "Functions Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Loadbalancer loggroup resource
resource "oci_logging_log_group" "lbloggroup" {

  for_each = toset(local.lbloggroup)

  compartment_id = var.compartment_id
  description    = "Loadbalancer Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#ObjectStorage loggroup resource
resource "oci_logging_log_group" "osloggroup" {

  for_each = toset(local.osloggroup)

  compartment_id = var.compartment_id
  description    = "ObjectStorage Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#VCN loggroup resource
resource "oci_logging_log_group" "vcnloggroup" {

  for_each = toset(local.vcnloggroup)

  compartment_id = var.compartment_id
  description    = "VCN flowlogs Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#VPN loggroup resource
resource "oci_logging_log_group" "vpnloggroup" {

  for_each = toset(local.vpnloggroup)

  compartment_id = var.compartment_id
  description    = "VPN IPSEC Loggroup"
  display_name   = each.value
  freeform_tags  = var.loggroup_tags

}

#Custom Linux loggroup resource
resource "oci_logging_log_group" "linuxloggroup" {

  for_each = toset(local.linuxloggroup)


  compartment_id = var.compartment_id
  display_name   = each.value
  description    = "Custom Linux logs loggroup"

  freeform_tags = var.loggroup_tags

}

#Custom windows loggroup resource
resource "oci_logging_log_group" "winloggroup" {

  for_each = toset(local.winloggroup)


  compartment_id = var.compartment_id
  display_name   = each.value
  description    = "Custom Windows logs loggroup"
  freeform_tags  = var.loggroup_tags

}
module "apigwlog" {
  source                 = "./modules/apigateway"
  compartment_id         = var.compartment_id
  logdefinition          = local.apigwlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.apigwloggroup

  count = length(local.apigwlogdef) >= 1 ? 1 : 0

}

module "customlog" {
  source                 = "./modules/custom"
  compartment_id         = var.compartment_id
  linux_logdef           = var.linux_logdef
  windows_logdef         = var.windows_logdef
  log_retention_duration = var.log_retention_duration
  tenancy_id             = var.tenancy_id
  linuxloggroup          = oci_logging_log_group.linuxloggroup
  winloggroup            = oci_logging_log_group.winloggroup


  count = (length(var.linux_logdef)) >= 1 || (length(var.windows_logdef)) >= 1 ? 1 : 0

}
module "devopslog" {
  source                 = "./modules/devops"
  compartment_id         = var.compartment_id
  logdefinition          = local.devopslogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.devopsloggroup

  count = length(local.devopslogdef) >= 1 ? 1 : 0

}

module "emaillog" {
  source                 = "./modules/emaildelivery"
  compartment_id         = var.compartment_id
  logdefinition          = local.emaillogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.emailloggroup

  count = length(local.emaillogdef) >= 1 ? 1 : 0

}
module "eventlog" {
  source                 = "./modules/event"
  compartment_id         = var.compartment_id
  logdefinition          = local.eventlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.eventloggroup

  count = length(local.eventlogdef) >= 1 ? 1 : 0

}

module "funclog" {
  source                 = "./modules/function"
  compartment_id         = var.compartment_id
  logdefinition          = local.funclogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.funcloggroup

  count = length(local.funclogdef) >= 1 ? 1 : 0

}

module "lblog" {
  source                 = "./modules/lb"
  compartment_id         = var.compartment_id
  logdefinition          = local.lblogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.lbloggroup

  count = length(local.lblogdef) >= 1 ? 1 : 0

}

module "objectstorelog" {
  source                 = "./modules/objectstorage"
  compartment_id         = var.compartment_id
  logdefinition          = local.oslogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.osloggroup

  count = length(local.oslogdef) >= 1 ? 1 : 0

}

module "vcnlog" {
  source                 = "./modules/vcn"
  compartment_id         = var.compartment_id
  logdefinition          = local.vcnlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.vcnloggroup
  vcn_id                 = var.vcn_id

  count = length(local.vcnlogdef) >= 1 ? 1 : 0

}

module "vpnlog" {
  source                 = "./modules/vpn"
  compartment_id         = var.compartment_id
  logdefinition          = local.vpnlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.vpnloggroup

  count = length(local.vpnlogdef) >= 1 ? 1 : 0

}
