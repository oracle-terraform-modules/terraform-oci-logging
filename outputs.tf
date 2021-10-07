#APIGW log and loggroup id
output "apigw_execlogid" {
  value       = try(module.apigwlog[0].apigw_execlogid, "")
  description = "APIGateway execution logs id"
}

output "apigw_accesslogid" {
  value       = try(module.apigwlog[0].apigw_loggroupid, "")
  description = "APIGateway access logs id"
}

output "apigw_loggroupid" {
  value       = try(module.apigwlog[0].apigw_loggroupid, "")
  description = "APIGateway loggroup id"
}

#Devops log and loggroup id
output "devops_logid" {
  value       = try(module.devopslog[0].devops_logid, "")
  description = "Devops logs id"
}

output "devops_loggroupid" {
  value       = try(module.devopslog[0].devops_loggroupid, "")
  description = "Devops loggroup id"
}

#event log and loggroup id
output "email_acceptlogid" {
  value       = try(module.emaillog[0].emaillogaccept_id, "")
  description = "Email logs id"
}

output "email_relaylogid" {
  value       = try(module.emaillog[0].emaillogrelay_id, "")
  description = "Email logs id"
}

output "email_loggroupid" {
  value       = try(module.emaillog[0].emailloggroup_id, "")
  description = "Email loggroup id"

}

#event log and loggroup id
output "event_logid" {
  value       = try(module.eventlog[0].event_logid, "")
  description = "Event logs id"
}

output "event_loggroupid" {
  value       = try(module.eventlog[0].event_loggroupid, "")
  description = "Event loggroup id"

}

#Function log and loggroup id
output "func_logid" {
  value       = try(module.funclog[0].func_logid, "")
  description = "Function logs id"
}

output "func_loggroupid" {
  value       = try(module.funclog[0].func_loggroupid, "")
  description = "Function loggroup id"
}

#Integration log and loggroup id
output "int_logid" {
  value       = try(module.intlog[0].int_logid, "")
  description = "Integration logs id"
}

output "int_loggroupid" {
  value       = try(module.intlog[0].int_loggroupid, "")
  description = "Integration loggroup id"
}

#Loadbalancer log and loggroup id
output "lb_accesslogid" {
  value       = try(module.lblog[0].lb_accesslogid, "")
  description = "Loadbalancer access logs id"
}

output "lb_errorlogid" {
  value       = try(module.lblog[0].lb_errorlogid, "")
  description = "Loadbalancer error logs id"
}

output "lb_loggroupid" {
  value       = try(module.lblog[0].lb_loggroupid, "")
  description = "Loadbalancer loggroup id"
}

#Linux custom log and loggroup id
output "linux_logid" {
  value       = try(module.customlog[0].linuxlogid, "")
  description = "Custom Linux logs id"
}

output "linux_loggroupid" {
  value       = try(module.customlog[0].linuxloggroupid, "")
  description = "Custom Linux loggroup id"
}

#ObjectStorage log  and loggroup id
output "os_readlogid" {
  value       = try(module.objectstorelog[0].os_readlogid, "")
  description = "ObjectStorage read logs id"
}

output "os_writelogid" {
  value       = try(module.objectstorelog[0].os_writelogid, "")
  description = "ObjectStorage write logs id"
}

output "os_loggroupid" {
  value       = try(module.objectstorelog[0].os_loggroupid, "")
  description = "ObjectStorage loggroup id"
}

#VCN log and loggroup id
output "vcn_logid" {
  value       = try(module.vcnlog[0].vcn_logid, "")
  description = "VCN subnet flowlogs log id"

}

output "vcn_loggroupid" {
  value       = try(module.vcnlog[0].vcn_loggroupid, "")
  description = "VCN subnet flowlogs loggroup id"
}

#vpn log and loggroup id
output "vpn_logid" {
  value       = try(module.vpnlog[0].vpn_logid, "")
  description = "VPN  IPSEC read logs id"
}

output "vpn_loggroupid" {
  value       = try(module.vpnlog[0].vpn_loggroupid, "")
  description = "VPN IPSEC loggroup id"

}

#Windows custom log and loggroup id
output "windows_logid" {
  value       = try(module.customlog[0].windowslogid, "")
  description = "Custom Windows logs id"
}

output "windows_loggroupid" {
  value       = try(module.customlog[0].windowsloggroupid, "")
  description = "Custom Windows loggroup id"
}
