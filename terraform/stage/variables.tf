variable "env" {
  default     = "stage"
  description = "Name of Env for deploy"
}

variable "name" {
  default = "reddit-app"
}
variable "count_instance" {
  default = 1
}

# variable "subnet" {
#   default = "b0coclf2t4vqo8bpua85"
# }

variable "source_image_id" {
  default = "fd8pa3bmio9agfd3iu36"

}


variable cloud_id {
  default = "b1g9km5jt6k903v0qovb"
}

variable folder_id {
  default = "b1glfijn6etao0fislln"
}

variable zone {
  description = "Zone"
  default     = "ru-central1-c"
}
variable public_key_path {
  default = "~/.ssh/otus/otus_demo_key.pub"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "fd8m07nmiq36a5tjfakr"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "fd8gja2tp5tekdjnhr9r"
}

variable "backend_access_key" {
  description = "backend_access_key"
}


variable "backend_secret_key" {
  description = "backend_secret_key"
}

variable "subnet_id" {
  description = "subnet_id"
}
