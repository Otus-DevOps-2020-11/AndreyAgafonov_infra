provider "yandex" {
  service_account_key_file = file("~/.ssh/otus/ya_sa_key.json")
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  zone                     = var.zone
}


resource "yandex_compute_instance" "app" {
  count       = var.count_instance
  name        = "${var.name}-${count.index + 1}"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашнем задании
      image_id = var.source_image_id
    }
  }
  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet
    nat       = false
  }
  metadata = {
    ssh-keys = "ubuntu:${file("${var.public_key_path}")}"
  }
  #   provisioner "file" {
  #     source      = "files/puma.service"
  #     destination = "/tmp/puma.service"
  #   }
}
