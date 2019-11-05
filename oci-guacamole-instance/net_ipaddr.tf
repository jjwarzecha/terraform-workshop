# List public IPs: 
#  - Public IP with regional scope (reserved).

data "oci_core_public_ips" "region_public_ips_list" {
  compartment_id = "${var.compartment_ocid}"
  scope          = "REGION"
}

output "public_ips" {
  value = [
    "${data.oci_core_public_ips.region_public_ips_list.public_ips}",
  ]
}

