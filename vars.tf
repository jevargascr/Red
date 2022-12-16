variable compartment_ocid { default = "ocid1.compartment.oc1..aaaaaaaaqcgo3o3kzrbfsnwxtyab74yvfg46isooezgwsvjmczuutl4ucwyq" }
variable region { default = "us-ashburn-1" }
variable "create_service_gateway" {
  description = "whether to create a service gateway. If set to true, creates a service gateway."
  default     = false
  type        = bool
}
