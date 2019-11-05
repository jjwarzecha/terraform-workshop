data "oci_identity_availability_domains" "ads" {
  compartment_id = "${var.compartment_ocid}"
}

output "ad1" {
  value = "${data.oci_identity_availability_domains.ads.availability_domains[0].name}"
}

output "ad2" {
  value = "${data.oci_identity_availability_domains.ads.availability_domains[1].name}"
}

output "ad3" {
  value = "${data.oci_identity_availability_domains.ads.availability_domains[2].name}"
}
