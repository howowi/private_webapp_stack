terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.1.0"
    }
    oci = {
      source  = "hashicorp/oci"
      version = ">= 3.30.0"
    }
  }
  required_version = ">= 1.0"
}

provider "oci" {
  region          = var.region
  tenancy_ocid    = var.tenancy_ocid
}

variable "compartment_ocid" {
  description = "Please provide compartment OCID."
  type        = string
}

variable "tenancy_ocid" {
  description = "Please provide tenancy OCID."
  type = string
}

variable "region" {
  description = "Please provide region."
  type        = string
}

variable "generic_vcn_cidr_blocks" {
  description = "VCN CIDR Block"
}

variable "public_subnet" {
  description = "Public Subnet"
}

variable "ssh_public_key" {
  description = "SSH public key to access node"
  type        = string
}

variable "instance_shape" {
  description = "Instance shape of the instance"
  default = "VM.Standard.E3.Flex"
}

variable "shape_ocpus" {
  description = "Number of OCPUs of each instance"
  default = "2"
}

variable "shape_mems" {
  description = "Memory of each instance in GB"
  default = "8"
}

variable "image_os_id" {
  description = "OS Image OCID for webapp"
  default = "ocid1.image.oc1.ap-singapore-1.aaaaaaaaicuzzdfskt4kqcxs3pl2d3krkv2rzztnhqqjkoqpjmfbdonu5fpq"
}

variable "display_name" {
  description = "Instance display name"
}

data oci_identity_availability_domain AD-1 {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}