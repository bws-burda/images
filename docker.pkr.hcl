build {
  source "source.openstack.ubuntu-2204" {
    name       = "ubuntu-docker"
    image_name = "Ubuntu 22.04 Docker"
  }

  provisioner "shell" {
    inline = ["sudo apt-get update", "sudo apt-get upgrade -y", "sudo apt-get -y install python3"]
  }

  provisioner "ansible" {
    playbook_file   = "./playbooks/docker.yml"
    extra_arguments = ["--scp-extra-args", "'-O'"]
    user            = "ubuntu"
  }
}