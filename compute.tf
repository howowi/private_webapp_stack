data "template_file" "user_data" {
    template = file("cloud_init.yaml")
}

resource "oci_core_instance" "webapp" {
  availability_domain = data.oci_identity_availability_domain.AD-1.name
  compartment_id      = var.compartment_ocid
  display_name        = var.display_name
  shape               = var.instance_shape

  create_vnic_details {
    subnet_id = var.public_subnet
    display_name = "primaryvnic"
  }
  shape_config {
    memory_in_gbs = var.shape_mems
    ocpus = var.shape_ocpus
  }
  source_details {
    source_type             = "image"
    source_id               = var.image_os_id
    boot_volume_size_in_gbs = "50"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(data.template_file.user_data.rendered)
  }
}