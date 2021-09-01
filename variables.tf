variable "compartment_id" {
  type        = string
  description = "compartment id where to create the resources"
}

variable "loggroup_tags" {
  type        = map(any)
  description = "Freeform Tags"
  default = {
    "Environment" = "Dev"
  }
}

variable "log_retention_duration" {
  type        = number
  default     = 30
  description = "Log retention duration"
}

variable "service_logdef" {
  type        = map(any)
  description = "OCI Service log definition"
  default     = {}
  validation {
    condition = (
      try(lookup(element(values(var.service_logdef), 0), "resource", null), {}) != null &&
      try(lookup(element(values(var.service_logdef), 0), "loggroup", null), {}) != null &&
    try(lookup(element(values(var.service_logdef), 0), "service", null), {}) != null)
    error_message = "All the keys like loggroup,service and resource are needed.Refer terraform.tfvars.example for reference."
  }
}

variable "linux_logdef" {
  type        = map(any)
  description = "Custom Linux Operating System Log Definition"
  default     = {}
  validation {
    condition = (
      try(lookup(element(values(var.linux_logdef), 0), "path", null), {}) != null &&
      try(lookup(element(values(var.linux_logdef), 0), "loggroup", null), {}) != null &&
    try(lookup(element(values(var.linux_logdef), 0), "dg", null), {}) != null)
    error_message = "All the keys like loggroup,dg and path are needed.Refer terraform.tfvars.example for reference."
  }
}

variable "windows_logdef" {
  type        = map(any)
  description = "Custom Windows Operating System Log Definition"
  default     = {}

  validation {
    condition = (

      try(lookup(element(values(var.windows_logdef), 0), "loggroup", null), {}) != null &&
    try(lookup(element(values(var.windows_logdef), 0), "dg", null), {}) != null)
    error_message = "All the keys like loggroup and dg are needed.Refer terraform.tfvars.example for reference."
  }
}

variable "tenancy_id" {
  type        = string
  description = "Tenancy OCID"
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID"
  default     = "none"
}
