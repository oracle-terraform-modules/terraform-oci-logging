#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to log resources."
  type        = string
}
variable "linux_logdef" {
  type        = map(any)
  description = "Custom Linux log definition"
}
variable "windows_logdef" {
  type        = map(any)
  description = "Custom Windows Log Definition"
}

variable "log_retention_duration" {
  type        = string
  description = "Log retention duration"
}

variable "compartment_id" {
  type        = string
  description = "Compartment OCID"
}

variable "tenancy_id" {
  description = "Tenancy OCID"
  type        = string

}

variable "linuxloggroup" {
  description = "Custom Linux loggroup"
}

variable "winloggroup" {
  description = "Custom Windows loggroup"
}
