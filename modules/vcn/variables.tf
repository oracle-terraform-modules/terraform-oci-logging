#Copyright (c) 2021, 2023 Oracle Corporation and/or its affiliates.
#Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl

variable "logdefinition" {
  type        = map(any)
  description = "Log definition"
}

variable "log_retention_duration" {
  type        = string
  description = "Duration to retain logs"
}

variable "compartment_id" {
  type        = string
  description = "Compartment ID where the resources will be created"
}

variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to log resources."
  type        = string
}
variable "loggroup" {
  type        = map(any)
  description = "Log Group"
}

variable "vcn_id" {
  type        = string
  description = "VCN OCID"
}
