packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/openstack"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">=1.0.4"
    }
  }
}

source "openstack" "ubuntu-2204" {
  flavor                  = var.flavor
  image_visibility        = "private"
  image_disk_format       = "qcow2"
  networks                = [var.network]
  source_image            = var.source_image
  use_blockstorage_volume = true
  volume_size             = 8
  floating_ip_network     = var.floating_ip_network
  security_groups         = [var.security_group]
  ssh_username            = "ubuntu"
  image_min_disk          = 8
  pause_before_connecting = "30s"
}
