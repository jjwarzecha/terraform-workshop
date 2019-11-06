resource "oci_core_instance" "test_instance" {
  count               = "${var.num_instances}"
  availability_domain = "${data.oci_identity_availability_domain.ad.name}"
  compartment_id      = "${var.compartment_ocid}"
  display_name        = "${var.prefix}TestInstance${count.index}"
  shape               = "${var.instance_shape}"

  create_vnic_details {
    subnet_id        = "${oci_core_subnet.test_subnet.id}"
    display_name     = "Primaryvnic"
    assign_public_ip = true
    hostname_label   = "tfexampleinstance${count.index}"
  }

  source_details {
    source_type = "image"
    source_id   = "${var.instance_image_ocid[var.region]}"
  }

  metadata = {
    ssh_authorized_keys = "${file("./.ssh/id_rsa.pub")}"
    user_data           = "${base64encode(file("./userdata/bootstrap"))}"
  }

  freeform_tags = "${map("freeformkey${count.index}", "freeformvalue${count.index}")}"
  timeouts {
    create = "60m"
  }
}
