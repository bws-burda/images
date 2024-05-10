build {
  source "source.openstack.ubuntu-2204" {
    name       = "ubuntu-mysql"
    image_name = "Ubuntu 22.04 MySQL"
  }

  provisioner "shell" {
    inline = ["sudo apt-get update", "sudo apt-get upgrade -y", "sudo apt-get -y install python3"]
  }

  provisioner "ansible" {
    playbook_file   = "./playbooks/mysql.yml"
    extra_arguments = ["--scp-extra-args", "'-O'"]
    user            = "ubuntu"
  }
}