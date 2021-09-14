variable "label_prefix" {
  default     = "none"
  description = "A string that will be prepended to log resources."
  type        = string
}
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

variable "loggroup" {
  type        = map(any)
  description = "Log Group"
}
