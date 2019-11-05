resource "oci_core_vcn" "test_vcn" {
    cidr_block     = "${var.vcn_cidr_block}"
    compartment_id = "${var.compartment_ocid}"
    display_name   = "${var.prefix}testVcn"
    dns_label      = "testvcn"
}

resource "oci_core_subnet" "test_subnet" {
    availability_domain = "${data.oci_identity_availability_domain.ad.name}"
    cidr_block          = "${var.vcn_test_subnet_cidr_block}"
    display_name        = "${var.prefix}TestSubnet"
    dns_label           = "testsubnet"
    security_list_ids   = ["${oci_core_vcn.test_vcn.default_security_list_id}"]
    compartment_id      = "${var.compartment_ocid}"
    vcn_id              = "${oci_core_vcn.test_vcn.id}"
    route_table_id      = "${oci_core_vcn.test_vcn.default_route_table_id}"
    dhcp_options_id     = "${oci_core_vcn.test_vcn.default_dhcp_options_id}"
}

resource "oci_core_nat_gateway" "test_nat_gateway" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
  display_name   = "nat_gateway"
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "proxy_prototype"
  vcn_id         = "${oci_core_vcn.test_vcn.id}"
}


data "oci_identity_availability_domain" "ad" {
    compartment_id = "${var.tenancy_ocid}"
    ad_number      = 3
}

