resource "oci_core_virtual_network" "vcn_default" {
  cidr_block     = "${var.vcn_default_cidr_block}"
  dns_label      = "vcndefault"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "vcn_default"
}

resource "oci_core_internet_gateway" "vcn_default_internet_gateway" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "ig_01"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"
}
