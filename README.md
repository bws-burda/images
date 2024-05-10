# BWS Images

This repository contains templates
to build new images with 
[Packer](https://developer.hashicorp.com/packer).

Provisioning is done with [Ansible](https://www.ansible.com/).

Packer will create a temorary instance in your BWS account, provision the
instance and create an image from the instance's volume. The instance is
then deleted again.

## Prerequisites

### Packer

Install Packer, see https://developer.hashicorp.com/packer/install.

### Ansible

Install Python and Ansible, see 
https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html.

### BWS

In you BWS account create a private network with a sub net, a router and
a security group that allows ssh. Note the id of the network and the name
of the security group.

To allow Packer to create the instance you need to supply your BWS
credentials via environment variables, e.g. by sourcing your openrc.sh or 
setting OS_CLOUD when using a clouds.yaml file.

### Variables

To tell Packer the network's id and the security group's name create a file 
named ```variables.auto.pkrvars.hcl``` with the following content:

```hcl
network        = "<your network's id>"
security_group = "<your security group's name"
```

## Images

You can build the following images (or all at once). After installing the
required software and cloning this repo run 

```shell
packer init .
```

once to install Packer dependencies.

To build all images run

```shell
packer build .
```

### Docker

Ubuntu 22.04 with latest Docker installed. Run 

```shell
packer build -only=opentstack.ubuntu-docker .
```

to build only this image.

### MySQL

Ubuntu 22.04 with standard MySQL installed. Run

```shell
packer build -only=opentstack.ubuntu-mysql .
```

to build only this image.

### MariaDB

Ubuntu 22.04 with standard MariaDB installed. Run

```shell
packer build -only=opentstack.ubuntu-mariadb .
```

to build only this image.

### PostgreSQL

Ubuntu 22.04 with standard PostgreSQL installed. Run

```shell
packer build -only=opentstack.ubuntu-postgresql .
```

to build only this image.




