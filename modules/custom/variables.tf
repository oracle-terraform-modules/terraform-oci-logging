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
