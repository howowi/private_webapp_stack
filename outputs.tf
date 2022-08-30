output webapp_url {
    value = "http://${oci_core_instance.webapp.public_ip}"
}