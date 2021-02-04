resource "yandex_compute_instance" "db" {
  name        = "${var.env}-reddit-db"
  platform_id = var.platform_id
  labels      = var.labels
  resources {
    cores         = var.instance_resources[0].res_cpu
    memory        = var.instance_resources[0].res_mem
    core_fraction = var.instance_resources[0].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
      size     = var.instance_boot_disk[0].size
      type     = var.instance_boot_disk[0].type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.instance_nat_enabled
  }

  # dynamic "secondary_disk" {
  #   for_each = module.secondary_disk[count.index].disk_id
  #   # yandex_compute_disk.second_disks[*].id
  #   content {
  #     auto_delete = true
  #     disk_id     = secondary_disk.value
  #   }
  # }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file("~/.ssh/otus/otus_demo_key")
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 30",
      "sudo apt-get update -y",
      "sudo apt-get install python -y"
    ]
  }
}
