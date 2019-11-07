resource "oci_core_vcn" "test_vcn" {
  cidr_block     = "${var.vcn_cidr_block}"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.prefix}testVcn"
  dns_label      = "testvcn"
}

resource "oci_core_subnet" "test_subnet" {
  cidr_block          = "${var.vcn_test_subnet_cidr_block}"
  display_name        = "${var.prefix}TestSubnet"
  dns_label           = "testsubdb"
  security_list_ids   = ["${oci_core_vcn.test_vcn.default_security_list_id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.test_vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table_default.id}"
  dhcp_options_id     = "${oci_core_vcn.test_vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "test_subnet_backup" {
  cidr_block          = "${var.vcn_test_subnet_backup_cidr_block}"
  display_name        = "${var.prefix}TestSubnetBackup"
  dns_label           = "testsubdbbkp"
  security_list_ids   = ["${oci_core_vcn.test_vcn.default_security_list_id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.test_vcn.id}"
  route_table_id      = "${oci_core_vcn.test_vcn.default_route_table_id}"
  dhcp_options_id     = "${oci_core_vcn.test_vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "subnetdb" {
  cidr_block          = "10.1.20.0/24"
  display_name        = "${var.prefix}SubnetDBSystem"
  dns_label           = "subdbsys"
  security_list_ids   = ["${oci_core_vcn.test_vcn.default_security_list_id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.test_vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table.id}"
  dhcp_options_id     = "${oci_core_vcn.test_vcn.default_dhcp_options_id}"
}

resource "oci_core_subnet" "subnetdb_backup" {
  cidr_block          = "10.1.21.0/24"
  display_name        = "${var.prefix}SubnetDBSystemBackup"
  dns_label           = "subdbsysbkp"
  security_list_ids   = ["${oci_core_vcn.test_vcn.default_security_list_id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.test_vcn.id}"
  route_table_id      = "${oci_core_route_table.route_table_backup.id}"
  dhcp_options_id     = "${oci_core_vcn.test_vcn.default_dhcp_options_id}"
}

resource "oci_core_route_table" "route_table_default" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "${var.prefix}System"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig.id}"
  }
}

resource "oci_core_route_table" "route_table" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "${var.prefix}RTDBSystem"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig.id}"
  }
}

resource "oci_core_route_table" "route_table_backup" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "${var.prefix}RTDBSystemBackup"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.ig.id}"
  }
}


resource "oci_core_nat_gateway" "test_nat_gateway" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "${var.prefix}nat_gateway"
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "${var.prefix}ig"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
}


data "oci_identity_availability_domain" "ad" {
  compartment_id = "${var.tenancy_ocid}"
  ad_number      = 3
}

