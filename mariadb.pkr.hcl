build {
  source "source.openstack.ubuntu-2204" {
    name       = "ubuntu-mariadb"
    image_name = "Ubuntu 22.04 MariaDB"
  }

  provisioner "shell" {
    inline = ["sudo apt-get update", "sudo apt-get upgrade -y", "sudo apt-get -y install python3"]
  }

  provisioner "ansible" {
    playbook_file   = "./playbooks/mariadb.yml"
    extra_arguments = ["--scp-extra-args", "'-O'"]
    user            = "ubuntu"
  }
}