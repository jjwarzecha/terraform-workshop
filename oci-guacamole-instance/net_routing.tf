resource "oci_core_route_table" "routing_table_default" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"
  display_name   = "vcn_default_routing_table_default"

  route_rules {
    destination_type  = "CIDR_BLOCK"
    destination       = "0.0.0.0/0"
    network_entity_id = "${oci_core_internet_gateway.vcn_default_internet_gateway.id}"
  }
}
