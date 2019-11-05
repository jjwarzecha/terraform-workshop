output "guacamole01_private_ip_addresses" {
  value = ["${oci_core_instance.guacamole01.private_ip}", ]
}

output "guacamole01_public_ip_addresses" {
  value = ["${oci_core_instance.guacamole01.public_ip}", ]
}
