resource "oci_core_security_list" "security_list_default" {
  display_name   = "security_list_default"
  compartment_id = "${oci_core_virtual_network.vcn_default.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    protocol = "6"
    source = "0.0.0.0/0"
    tcp_options {
       max = 22
       min = 22
     }
   }

  ingress_security_rules {
    protocol = "6"
    source = "0.0.0.0/0"
    tcp_options {
       max = 8080
       min = 8080
     }
   }

//  ingress_security_rules {
//    protocol    = "all"
//    source   = "0.0.0.0/0"
//  }
}

###################################
#    SFTP server security list    #
###################################

# Additional security for local subnet

resource "oci_core_security_list" "local_sec_list_01" {
  display_name   = "local_security_list_01"
  compartment_id = "${oci_core_virtual_network.vcn_default.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
  //  ingress_security_rules = [
  //            { protocol = "all" source = "${var.vcn_default_cidr_block}" },
  //            { tcp_options { "max" = 22 "min" = 22 } protocol = "6" source   = "95.90.192.53/32" },
  //  //////////////          { tcp_options { "max" = 22 "min" = 22 } protocol = "6" source   = "0.0.0.0/0" },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 3} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 4} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 0 "code" = 1} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 8 "code" = 1} },
  //  ]
}



###################################
#    Data Base security list      #
###################################

# Additional security for local subnet
resource "oci_core_security_list" "local_sec_list_02" {
  display_name   = "local_security_list_02"
  compartment_id = "${oci_core_virtual_network.vcn_default.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }


  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
  //  ingress_security_rules = [
  //            { protocol    = "all" source = "${var.vcn_default_cidr_block}" },
  //            { tcp_options { "max" = 22 "min" = 22 } protocol = "6" source   = "95.90.192.53/32" },
  //  //////////////          { tcp_options { "max" = 22 "min" = 22 } protocol = "6" source   = "0.0.0.0/0" },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 3} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 4} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 0 "code" = 1} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 8 "code" = 1} },
  //  ]
}

# Additional security for local subnet
resource "oci_core_security_list" "local_sec_list_03" {
  display_name   = "local_security_list_03"
  compartment_id = "${oci_core_virtual_network.vcn_default.compartment_id}"
  vcn_id         = "${oci_core_virtual_network.vcn_default.id}"
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }


  ingress_security_rules {
    protocol  = 1
    source    = "0.0.0.0/0"
    stateless = true

    icmp_options {
      type = 3
      code = 4
    }
  }
  //  ingress_security_rules = [
  //            { protocol    = "all" source = "${var.vcn_default_cidr_block}" },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 3} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 3 "code" = 4} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 0 "code" = 1} },
  //            { protocol = 1 source = "0.0.0.0/0" stateless = true icmp_options { "type" = 8 "code" = 1} },
  //  ]
}
