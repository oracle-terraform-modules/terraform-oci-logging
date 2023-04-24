locals {
  apigwlogdef   = { for k, v in var.service_logdef : k => v if v.service == "apigateway" }
  apigwloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "apigateway"]

  apmlogdef   = { for k, v in var.service_logdef : k => v if v.service == "apm" }
  apmloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "apm"]

  devopslogdef   = { for k, v in var.service_logdef : k => v if v.service == "devops" }
  devopsloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "devops"]

  emaillogdef   = { for k, v in var.service_logdef : k => v if v.service == "email" }
  emailloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "email"]

  eventlogdef   = { for k, v in var.service_logdef : k => v if v.service == "cloudevents" }
  eventloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "cloudevents"]

  funclogdef   = { for k, v in var.service_logdef : k => v if v.service == "functions" }
  funcloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "functions"]

  intlogdef   = { for k, v in var.service_logdef : k => v if v.service == "integration" }
  intloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "integration"]

  lblogdef   = { for k, v in var.service_logdef : k => v if v.service == "loadbalancer" }
  lbloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "loadbalancer"]

  medialogdef   = { for k, v in var.service_logdef : k => v if v.service == "mediaflow" }
  medialoggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "mediaflow"]

  oslogdef   = { for k, v in var.service_logdef : k => v if v.service == "objectstorage" }
  osloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "objectstorage"]

  vcnlogdef   = { for k, v in var.service_logdef : k => v if v.service == "flowlogs" }
  vcnloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "flowlogs"]

  vpnlogdef   = { for k, v in var.service_logdef : k => v if v.service == "vpn" }
  vpnloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "vpn"]

  waflogdef   = { for k, v in var.service_logdef : k => v if v.service == "waf" }
  wafloggroup = [for k, v in var.service_logdef : v.loggroup if v.service == "waf"]
}

locals {
  linuxloggroup = [for k, v in var.linux_logdef : v.loggroup]
  winloggroup   = [for k, v in var.windows_logdef : v.loggroup]
}
