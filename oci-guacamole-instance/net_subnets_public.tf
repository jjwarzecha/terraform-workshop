resource "oci_core_subnet" "sub_01_public" {
#  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[0], "name")}"
  cidr_block          = "${var.vcn_default_subnets_cidr_blocks_public[0]}"
  display_name        = "sub-01-public"
  dns_label           = "sub01pub"
  security_list_ids = ["${oci_core_security_list.security_list_default.id}",
  "${oci_core_security_list.local_sec_list_01.id}"]
  compartment_id  = "${var.compartment_ocid}"
  vcn_id          = "${oci_core_virtual_network.vcn_default.id}"
  route_table_id  = "${oci_core_route_table.routing_table_default.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn_default.default_dhcp_options_id}"

//  provisioner "local-exec" {
//    command = "sleep 3"
//  }
}

resource "oci_core_subnet" "sub_02_public" {
#  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[1], "name")}"
  cidr_block          = "${var.vcn_default_subnets_cidr_blocks_public[1]}"
  display_name        = "sub-02-public"
  dns_label           = "sub02pub"
  security_list_ids = ["${oci_core_security_list.security_list_default.id}",
  "${oci_core_security_list.local_sec_list_02.id}"]
  compartment_id  = "${var.compartment_ocid}"
  vcn_id          = "${oci_core_virtual_network.vcn_default.id}"
  route_table_id  = "${oci_core_route_table.routing_table_default.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn_default.default_dhcp_options_id}"

}


resource "oci_core_subnet" "sub_03_public" {
#  availability_domain = "${lookup(data.oci_identity_availability_domains.ads.availability_domains[2], "name")}"
  cidr_block          = "${var.vcn_default_subnets_cidr_blocks_public[2]}"
  display_name        = "sub-03-public"
  dns_label           = "sub03pub"
  security_list_ids = ["${oci_core_security_list.security_list_default.id}",
  "${oci_core_security_list.local_sec_list_03.id}"]
  compartment_id  = "${var.compartment_ocid}"
  vcn_id          = "${oci_core_virtual_network.vcn_default.id}"
  route_table_id  = "${oci_core_route_table.routing_table_default.id}"
  dhcp_options_id = "${oci_core_virtual_network.vcn_default.default_dhcp_options_id}"

}
