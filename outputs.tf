#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

#APIGW log and loggroup id
output "apigw_execlogid" {
  value       = try(module.apigwlog[0].apigw_execlogid, null)
  description = "APIGateway execution logs id"
}

output "apigw_accesslogid" {
  value       = try(module.apigwlog[0].apigw_accesslogid, null)
  description = "APIGateway access logs id"
}

output "apigw_loggroupid" {
  value       = try(module.apigwlog[0].apigw_loggroupid, null)
  description = "APIGateway loggroup id"
}

#APM log and loggroup id
output "apm_droppeddatalogid" {
  value       = try(module.apmlog[0].apm_logid, null)
  description = "APM Dropped data logs id"
}

output "apm_loggroupid" {
  value       = try(module.apmlog[0].apm_loggroupid, null)
  description = "APM loggroup id"
}

#Devops log and loggroup id
output "devops_logid" {
  value       = try(module.devopslog[0].devops_logid, null)
  description = "Devops logs id"
}

output "devops_loggroupid" {
  value       = try(module.devopslog[0].devops_loggroupid, null)
  description = "Devops loggroup id"
}

#event log and loggroup id
output "email_acceptlogid" {
  value       = try(module.emaillog[0].emaillogaccept_id, null)
  description = "Email logs id"
}

output "email_relaylogid" {
  value       = try(module.emaillog[0].emaillogrelay_id, null)
  description = "Email logs id"
}

output "email_loggroupid" {
  value       = try(module.emaillog[0].emailloggroup_id, null)
  description = "Email loggroup id"

}

#event log and loggroup id
output "event_logid" {
  value       = try(module.eventlog[0].event_logid, null)
  description = "Event logs id"
}

output "event_loggroupid" {
  value       = try(module.eventlog[0].event_loggroupid, null)
  description = "Event loggroup id"

}

#Function log and loggroup id
output "func_logid" {
  value       = try(module.funclog[0].func_logid, null)
  description = "Function logs id"
}

output "func_loggroupid" {
  value       = try(module.funclog[0].func_loggroupid, null)
  description = "Function loggroup id"
}

#Integration log and loggroup id
output "int_logid" {
  value       = try(module.intlog[0].int_logid, null)
  description = "Integration logs id"
}

output "int_loggroupid" {
  value       = try(module.intlog[0].int_loggroupid, null)
  description = "Integration loggroup id"
}

#Loadbalancer log and loggroup id
output "lb_accesslogid" {
  value       = try(module.lblog[0].lb_accesslogid, null)
  description = "Loadbalancer access logs id"
}

output "lb_errorlogid" {
  value       = try(module.lblog[0].lb_errorlogid, null)
  description = "Loadbalancer error logs id"
}

output "lb_loggroupid" {
  value       = try(module.lblog[0].lb_loggroupid, null)
  description = "Loadbalancer loggroup id"
}

#Linux custom log and loggroup id
output "linux_logid" {
  value       = try(module.customlog[0].linuxlogid, null)
  description = "Custom Linux logs id"
}

output "linux_loggroupid" {
  value       = try(module.customlog[0].linuxloggroupid, null)
  description = "Custom Linux loggroup id"

}

#MediaFlow log and loggroup id
output "media_executionlogid" {
  value       = try(module.mediaflowlog[0].mediaflow_executionlogid, null)
  description = "MediaFlow execution logs id"
}

output "media_loggroupid" {
  value       = try(module.mediaflowlog[0].media_loggroupid, null)
  description = "MediaFlow loggroup id"
}

#ObjectStorage log  and loggroup id
output "os_readlogid" {
  value       = try(module.objectstorelog[0].os_readlogid, null)
  description = "ObjectStorage read logs id"
}

output "os_writelogid" {
  value       = try(module.objectstorelog[0].os_writelogid, null)
  description = "ObjectStorage write logs id"
}

output "os_loggroupid" {
  value       = try(module.objectstorelog[0].os_loggroupid, null)
  description = "ObjectStorage loggroup id"
}

#VCN log and loggroup id
output "vcn_logid" {
  value       = try(module.vcnlog[0].vcn_logid, null)
  description = "VCN subnet flowlogs log id"

}

output "vcn_loggroupid" {
  value       = try(module.vcnlog[0].vcn_loggroupid, null)
  description = "VCN subnet flowlogs loggroup id"
}

#vpn log and loggroup id
output "vpn_logid" {
  value       = try(module.vpnlog[0].vpn_logid, null)
  description = "VPN  IPSEC read logs id"

}

output "vpn_loggroupid" {
  value       = try(module.vpnlog[0].vpn_loggroupid, null)
  description = "VPN IPSEC loggroup id"

}

#WAF log and loggroup id
output "waf_logid" {
  value       = try(module.waflog[0].waf_logid, null)
  description = "WAF logs id"
}

output "waf_loggroupid" {
  value       = try(module.waflog[0].waf_loggroupid, null)
  description = "WAF loggroup id"

}

#Windows custom log and loggroup id
output "windows_logid" {
  value       = try(module.customlog[0].windowslogid, null)
  description = "Custom Windows logs id"
}

output "windows_loggroupid" {
  value       = try(module.customlog[0].windowsloggroupid, null)
  description = "Custom Windows loggroup id"
}
