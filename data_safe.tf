## This configuration was generated by terraform-provider-oci

resource oci_data_safe_user_assessment export_UA_1671207941057 {
  compartment_id = var.compartment_ocid
  #defined_tags = <<Optional value not found in discovery>>
  #description = <<Optional value not found in discovery>>
  display_name = "UA_1671207941057"
  freeform_tags = {
  }
  #schedule = <<Optional value not found in discovery>>
  target_id = "<placeholder for missing required attribute>" #Required attribute not found in discovery, placeholder value set to avoid plan failure

  # Required attributes that were not found in discovery have been added to lifecycle ignore_changes
  # This is done to avoid terraform plan failure for the existing infrastructure
  lifecycle {
    ignore_changes = [target_id]
  }
}

resource oci_data_safe_security_assessment export_SA_1671207941411 {
  compartment_id = var.compartment_ocid
  #defined_tags = <<Optional value not found in discovery>>
  #description = <<Optional value not found in discovery>>
  display_name = "SA_1671207941411"
  freeform_tags = {
  }
  #schedule = <<Optional value not found in discovery>>
  target_id = "<placeholder for missing required attribute>" #Required attribute not found in discovery, placeholder value set to avoid plan failure

  # Required attributes that were not found in discovery have been added to lifecycle ignore_changes
  # This is done to avoid terraform plan failure for the existing infrastructure
  lifecycle {
    ignore_changes = [target_id]
  }
}

