#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#APIGateway loggroup resource
resource "oci_logging_log_group" "apigwloggroup" {

  for_each = toset(local.apigwloggroup)

  compartment_id = var.compartment_id
  description    = "API Gateway Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#APM loggroup resource
resource "oci_logging_log_group" "apmloggroup" {

  for_each = toset(local.apmloggroup)

  compartment_id = var.compartment_id
  description    = "APM Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Devops loggroup
resource "oci_logging_log_group" "devopsloggroup" {

  for_each = toset(local.devopsloggroup)

  compartment_id = var.compartment_id
  description    = "Devops Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Email delivery loggroup resource
resource "oci_logging_log_group" "emailloggroup" {

  for_each = toset(local.emailloggroup)

  compartment_id = var.compartment_id
  description    = "Email Delivery Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Event Service loggroup resource
resource "oci_logging_log_group" "eventloggroup" {

  for_each = toset(local.eventloggroup)

  compartment_id = var.compartment_id
  description    = "Events Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Function loggroup resource
resource "oci_logging_log_group" "funcloggroup" {

  for_each = toset(local.funcloggroup)

  compartment_id = var.compartment_id
  description    = "Functions Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Integration loggroup resource
resource "oci_logging_log_group" "intloggroup" {

  for_each = toset(local.intloggroup)

  compartment_id = var.compartment_id
  description    = "Integration Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Loadbalancer loggroup resource
resource "oci_logging_log_group" "lbloggroup" {

  for_each = toset(local.lbloggroup)

  compartment_id = var.compartment_id
  description    = "Loadbalancer Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Mediaflow loggroup resource
resource "oci_logging_log_group" "medialoggroup" {

  for_each = toset(local.medialoggroup)

  compartment_id = var.compartment_id
  description    = "Mediaflow Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#ObjectStorage loggroup resource
resource "oci_logging_log_group" "osloggroup" {

  for_each = toset(local.osloggroup)

  compartment_id = var.compartment_id
  description    = "ObjectStorage Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#VCN loggroup resource
resource "oci_logging_log_group" "vcnloggroup" {

  for_each = toset(local.vcnloggroup)

  compartment_id = var.compartment_id
  description    = "VCN flowlogs Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#VPN loggroup resource
resource "oci_logging_log_group" "vpnloggroup" {

  for_each = toset(local.vpnloggroup)

  compartment_id = var.compartment_id
  description    = "VPN IPSEC Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#WAF loggroup resource
resource "oci_logging_log_group" "wafloggroup" {

  for_each = toset(local.wafloggroup)

  compartment_id = var.compartment_id
  description    = "WAF Loggroup"
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  freeform_tags  = var.loggroup_tags

}

#Custom Linux loggroup resource
resource "oci_logging_log_group" "linuxloggroup" {

  for_each = toset(local.linuxloggroup)


  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  description    = "Custom Linux logs loggroup"

  freeform_tags = var.loggroup_tags

}

#Custom windows loggroup resource
resource "oci_logging_log_group" "winloggroup" {

  for_each = toset(local.winloggroup)


  compartment_id = var.compartment_id
  display_name   = var.label_prefix == "none" ? each.value : format("%s-%s", var.label_prefix, each.value)
  description    = "Custom Windows logs loggroup"
  freeform_tags  = var.loggroup_tags

}
module "apigwlog" {
  source                 = "./modules/apigateway"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.apigwlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.apigwloggroup

  count = length(local.apigwlogdef) >= 1 ? 1 : 0

}

module "apmlog" {
  source                 = "./modules/apm"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.apmlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.apmloggroup

  count = length(local.apmlogdef) >= 1 ? 1 : 0

}

module "customlog" {
  source                 = "./modules/custom"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
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
  label_prefix           = var.label_prefix
  logdefinition          = local.devopslogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.devopsloggroup

  count = length(local.devopslogdef) >= 1 ? 1 : 0

}

module "emaillog" {
  source                 = "./modules/emaildelivery"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.emaillogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.emailloggroup

  count = length(local.emaillogdef) >= 1 ? 1 : 0

}
module "eventlog" {
  source                 = "./modules/event"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.eventlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.eventloggroup

  count = length(local.eventlogdef) >= 1 ? 1 : 0

}

module "funclog" {
  source                 = "./modules/function"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.funclogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.funcloggroup

  count = length(local.funclogdef) >= 1 ? 1 : 0

}

module "intlog" {
  source                 = "./modules/integration"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.intlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.intloggroup

  count = length(local.intlogdef) >= 1 ? 1 : 0

}
module "lblog" {
  source                 = "./modules/lb"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.lblogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.lbloggroup

  count = length(local.lblogdef) >= 1 ? 1 : 0

}

module "mediaflowlog" {
  source                 = "./modules/mediaflow"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.medialogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.medialoggroup

  count = length(local.medialogdef) >= 1 ? 1 : 0

}

module "objectstorelog" {
  source                 = "./modules/objectstorage"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.oslogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.osloggroup

  count = length(local.oslogdef) >= 1 ? 1 : 0

}

module "vcnlog" {
  source                 = "./modules/vcn"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.vcnlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.vcnloggroup
  vcn_id                 = var.vcn_id

  count = length(local.vcnlogdef) >= 1 ? 1 : 0

}

module "vpnlog" {
  source                 = "./modules/vpn"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.vpnlogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.vpnloggroup

  count = length(local.vpnlogdef) >= 1 ? 1 : 0

}

module "waflog" {
  source                 = "./modules/waf"
  compartment_id         = var.compartment_id
  label_prefix           = var.label_prefix
  logdefinition          = local.waflogdef
  log_retention_duration = var.log_retention_duration
  loggroup               = oci_logging_log_group.wafloggroup

  count = length(local.waflogdef) >= 1 ? 1 : 0

}
