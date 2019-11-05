resource "oci_core_instance" "guacamole01" {
  availability_domain = "${data.oci_identity_availability_domains.ads.availability_domains[1].name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "guacamole01"
  shape               = "${var.instance_shape}"

  source_details {
    source_id   = "${var.instance_image_ocid}"
    source_type = "image"
  }

  create_vnic_details {
    subnet_id              = "${oci_core_subnet.sub_01_public.id}"
    hostname_label         = "guacamole01"
    skip_source_dest_check = true
    assign_public_ip       = true
  }

  metadata = {
    ssh_authorized_keys = "${file("./.ssh/id_rsa.pub")}"
    user_data           = "${base64encode(file("./scripts/bootstrap.sh"))}"
  }

  lifecycle {
    ignore_changes = ["image", "metadata"]
  }
}
