resource "oci_core_vcn" "test_vcn" {

  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
}

resource "oci_core_subnet" "test_subnet" {
  cidr_block     = "10.0.29.0/24"
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.test_vcn.id
  display_name   = "loggingsubnet"

}

output "subnetname" {
  value       = oci_core_subnet.test_subnet.display_name
  description = "subnet display name"
}

output "vcn_id" {
  value       = oci_core_vcn.test_vcn.id
  description = "VCN OCID"
}

variable "compartment_id" {
  type        = string
  description = "compartment id"
}
