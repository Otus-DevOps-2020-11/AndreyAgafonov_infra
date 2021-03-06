variable "env" {}

variable "db_ext_address" {}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable subnet_id {
  description = "Subnets for modules"
}
variable "labels" {}
variable "instance_resources" {
  description = "Default instance size"
  default = [
    {
      res_cpu       = 2,
      res_mem       = 1,
      core_fraction = "5"
    }
  ]
}

variable "instance_boot_disk" {
  description = "Config boot disk"
  default = [
    {
      size = 20
      type = "network-hdd"
    }
  ]
}

variable "instance_secondary_disk" {
  description = "Config secondari disks"
  default = [
    {
      name = "datadrive"
      size = 1
      type = "network-hdd"
    },
    {
      name = "swap"
      size = 2
      type = "network-ssd"
    }
  ]
}

variable "instance_nat_enabled" {
  default = "true"
}

variable "platform_id" {
  default = "standard-v2"
}
