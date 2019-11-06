output "guacamole01_private_ip_addresses" {
  value = ["${oci_core_instance.test_instance.*.private_ip}", ]
}

output "guacamole01_public_ip_addresses" {
  value = ["${oci_core_instance.test_instance.*.public_ip}", ]
}
