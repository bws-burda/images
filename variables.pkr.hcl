variable "flavor" {
  type    = string
  default = "BWS-T1-2-1"
}

variable "source_image" {
  type        = string
  description = "ID of source image, e.g. Ubuntu 22.04"
  default     = "b6180d24-c421-4ad5-bae7-50b53b946fb0"
}

variable "floating_ip_network" {
  type    = string
  default = "Public1"
}

variable "network" {
  type        = string
  description = "ID of network to connect to"
}

variable "security_group" {
  type        = string
  description = "Name of the security group that allows ssh"
}