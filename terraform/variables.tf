variable "name" {
  default = "reddit-app"
}
variable "count_instance" {
  default = 1
}

variable "subnet" {
  default = "b0coclf2t4vqo8bpua85"
}

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
