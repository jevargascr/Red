## This configuration was generated by terraform-provider-oci

resource oci_core_vcn export_VCN-Non-Production {
  #byoipv6cidr_details = <<Optional value not found in discovery>>
  #cidr_block = <<Optional value not found in discovery>>
  cidr_blocks = [
    "10.56.4.0/24",
  ]
  compartment_id = var.compartment_ocid
  display_name = "VCN-Non-Production"
  dns_label    = "vcnnonproductio"
  freeform_tags = {
  }
  ipv6private_cidr_blocks = [
  ]
  #is_ipv6enabled = <<Optional value not found in discovery>>
  #is_oracle_gua_allocation_enabled = <<Optional value not found in discovery>>
}

resource oci_core_vcn export_VCN-Production {
  #byoipv6cidr_details = <<Optional value not found in discovery>>
  #cidr_block = <<Optional value not found in discovery>>
  cidr_blocks = [
    "10.56.5.0/24",
  ]
  compartment_id = var.compartment_ocid
  display_name = "VCN-Production"
  dns_label    = "vcnproduction"
  freeform_tags = {
  }
  ipv6private_cidr_blocks = [
  ]
  #is_ipv6enabled = <<Optional value not found in discovery>>
  #is_oracle_gua_allocation_enabled = <<Optional value not found in discovery>>
}

resource oci_core_internet_gateway export_IGW {
  compartment_id = var.compartment_ocid

  display_name = "IGW"
  enabled      = "true"
  freeform_tags = {
  }
  #route_table_id = <<Optional value not found in discovery>>
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_internet_gateway export_IGW_1 {
  compartment_id = var.compartment_ocid
  display_name = "IGW"
  enabled      = "true"
  freeform_tags = {
  }
  #route_table_id = <<Optional value not found in discovery>>
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_subnet export_SN_Bastion {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.5.192/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Production.default_dhcp_options_id
  display_name    = "SN_Bastion"
  dns_label       = "snbastion"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_route_table.export_RT_Bastion_1.id
  security_list_ids = [
    oci_core_security_list.export_SL_Bastion_1.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_subnet export_SN_App {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.5.128/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Production.default_dhcp_options_id
  display_name    = "SN_App"
  dns_label       = "snapp"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_App_1.id
  security_list_ids = [
    oci_core_security_list.export_SL_App_1.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_subnet export_SN_Backup {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.5.64/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Production.default_dhcp_options_id
  display_name    = "SN_Backup"
  dns_label       = "snbackup"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_Backup_1.id
  security_list_ids = [
    oci_core_security_list.export_SL_Backup_1.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_subnet export_SN_Client {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.5.0/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Production.default_dhcp_options_id
  display_name    = "SN_Client"
  dns_label       = "snclient"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_Client_1.id
  security_list_ids = [
    oci_core_security_list.export_SL_Client_1.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_subnet export_SN_Backup_1 {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.4.64/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Non-Production.default_dhcp_options_id
  display_name    = "SN_Backup"
  dns_label       = "snbackup"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_Backup.id
  security_list_ids = [
    oci_core_security_list.export_SL_Backup.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_subnet export_SN_Bastion_1 {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.4.192/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Non-Production.default_dhcp_options_id
  display_name    = "SN_Bastion"
  dns_label       = "snbastion"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_route_table.export_RT_Bastion.id
  security_list_ids = [
    oci_core_security_list.export_SL_Bastion.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_subnet export_SN_App_1 {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.4.128/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Non-Production.default_dhcp_options_id
  display_name    = "SN_App"
  dns_label       = "snapp"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_App.id
  security_list_ids = [
    oci_core_security_list.export_SL_App.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_subnet export_SN_Client_1 {
  #availability_domain = <<Optional value not found in discovery>>
  cidr_block     = "10.56.4.0/26"
  compartment_id = var.compartment_ocid
  dhcp_options_id = oci_core_vcn.export_VCN-Non-Production.default_dhcp_options_id
  display_name    = "SN_Client"
  dns_label       = "snclient"
  freeform_tags = {
  }
  #ipv6cidr_block = <<Optional value not found in discovery>>
  ipv6cidr_blocks = [
  ]
  prohibit_internet_ingress  = "true"
  prohibit_public_ip_on_vnic = "true"
  route_table_id             = oci_core_route_table.export_RT_Client.id
  security_list_ids = [
    oci_core_security_list.export_SL_Client.id,
  ]
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_service_gateway export_SGW {
  compartment_id = var.compartment_ocid
  display_name = "SGW"
  freeform_tags = {
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_service_gateway export_SGW_1 {
  compartment_id = var.compartment_ocid
  display_name = "SGW"
  freeform_tags = {
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_default_dhcp_options export_Default-DHCP-Options-for-VCN-Non-Production {
  compartment_id = var.compartment_ocid
  display_name     = "Default DHCP Options for VCN-Non-Production"
  domain_name_type = "CUSTOM_DOMAIN"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Non-Production.default_dhcp_options_id
  options {
    custom_dns_servers = [
    ]
    #search_domain_names = <<Optional value not found in discovery>>
    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }
  options {
    #custom_dns_servers = <<Optional value not found in discovery>>
    search_domain_names = [
      "vcnnonproductio.oraclevcn.com",
    ]
    #server_type = <<Optional value not found in discovery>>
    type = "SearchDomain"
  }
}

resource oci_core_nat_gateway export_NGW {
  block_traffic  = "false"
  compartment_id = var.compartment_ocid
  display_name = "NGW"
  freeform_tags = {
  }
  public_ip_id = "ocid1.publicip.oc1.iad.aaaaaaaabp5clxbzzz4muy2utqndjbb4rporqyhixpnye5hup6gvxkodz7oa"
  #route_table_id = <<Optional value not found in discovery>>
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_route_table export_RT_Bastion {
  compartment_id = var.compartment_ocid
  display_name = "RT_Bastion"
  freeform_tags = {
  }
  route_rules {
    description       = "Ruta a Internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.export_IGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_route_table export_RT_App {
  compartment_id = var.compartment_ocid
  display_name = "RT_App"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_route_table export_RT_Backup {
  compartment_id = var.compartment_ocid
  display_name = "RT_Backup"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_route_table export_RT_Client {
  compartment_id = var.compartment_ocid
  display_name = "RT_Client"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_default_route_table export_Default-Route-Table-for-VCN-Non-Production {
  compartment_id = var.compartment_ocid
  display_name = "Default Route Table for VCN-Non-Production"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Non-Production.default_route_table_id
}

resource oci_core_security_list export_SL_Bastion {
  compartment_id = var.compartment_ocid
  display_name = "SL_Bastion"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_security_list export_SL_App {
  compartment_id = var.compartment_ocid
  display_name = "SL_App"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_security_list export_SL_Backup {
  compartment_id = var.compartment_ocid
  display_name = "SL_Backup"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_security_list export_SL_Client {
  compartment_id = var.compartment_ocid
  display_name = "SL_Client"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Non-Production.id
}

resource oci_core_default_security_list export_Default-Security-List-for-VCN-Non-Production {
  compartment_id = var.compartment_ocid
  display_name = "Default Security List for VCN-Non-Production"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.4.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Non-Production.default_security_list_id
}

resource oci_core_default_dhcp_options export_Default-DHCP-Options-for-VCN-Production {
  compartment_id = var.compartment_ocid
  display_name     = "Default DHCP Options for VCN-Production"
  domain_name_type = "CUSTOM_DOMAIN"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Production.default_dhcp_options_id
  options {
    custom_dns_servers = [
    ]
    #search_domain_names = <<Optional value not found in discovery>>
    server_type = "VcnLocalPlusInternet"
    type        = "DomainNameServer"
  }
  options {
    #custom_dns_servers = <<Optional value not found in discovery>>
    search_domain_names = [
      "vcnproduction.oraclevcn.com",
    ]
    #server_type = <<Optional value not found in discovery>>
    type = "SearchDomain"
  }
}

resource oci_core_nat_gateway export_NGW_1 {
  block_traffic  = "false"
  compartment_id = var.compartment_ocid
  display_name = "NGW"
  freeform_tags = {
  }
  public_ip_id = "ocid1.publicip.oc1.iad.aaaaaaaafkbrztsvlvruudg7imllweasjr37scrjz5x5pffnsfzxzfd6i7ma"
  #route_table_id = <<Optional value not found in discovery>>
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_route_table export_RT_Bastion_1 {
  compartment_id = var.compartment_ocid
  display_name = "RT_Bastion"
  freeform_tags = {
  }
  route_rules {
    description       = "Ruta a Internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.export_IGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_route_table export_RT_App_1 {
  compartment_id = var.compartment_ocid
  display_name = "RT_App"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_route_table export_RT_Backup_1 {
  compartment_id = var.compartment_ocid
  display_name = "RT_Backup"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_route_table export_RT_Client_1 {
  compartment_id = var.compartment_ocid
  display_name = "RT_Client"
  freeform_tags = {
  }
  route_rules {
    description       = "Nat Gateway"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.export_NGW_1.id
    #route_type = <<Optional value not found in discovery>>
  }
  route_rules {
    description       = "Service Gateway"
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.export_SGW.id
    #route_type = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_default_route_table export_Default-Route-Table-for-VCN-Production {
  compartment_id = var.compartment_ocid
  display_name = "Default Route Table for VCN-Production"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Production.default_route_table_id
}

resource oci_core_security_list export_SL_Bastion_1 {
  compartment_id = var.compartment_ocid
  display_name = "SL_Bastion"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_security_list export_SL_App_1 {
  compartment_id = var.compartment_ocid
  display_name = "SL_App"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_security_list export_SL_Backup_1 {
  compartment_id = var.compartment_ocid
  display_name = "SL_Backup"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_security_list export_SL_Client_1 {
  compartment_id = var.compartment_ocid
  display_name = "SL_Client"
  egress_security_rules {
    description      = "Salida"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    description = "SSH Interno"
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Discovery Interno"
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    description = "Ping Interno"
    icmp_options {
      code = "-1"
      type = "8"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  vcn_id = oci_core_vcn.export_VCN-Production.id
}

resource oci_core_default_security_list export_Default-Security-List-for-VCN-Production {
  compartment_id = var.compartment_ocid
  display_name = "Default Security List for VCN-Production"
  egress_security_rules {
    #description = <<Optional value not found in discovery>>
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    #icmp_options = <<Optional value not found in discovery>>
    protocol  = "all"
    stateless = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  freeform_tags = {
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    #icmp_options = <<Optional value not found in discovery>>
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
      #source_port_range = <<Optional value not found in discovery>>
    }
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  ingress_security_rules {
    #description = <<Optional value not found in discovery>>
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.56.5.0/24"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    #tcp_options = <<Optional value not found in discovery>>
    #udp_options = <<Optional value not found in discovery>>
  }
  manage_default_resource_id = oci_core_vcn.export_VCN-Production.default_security_list_id
}

