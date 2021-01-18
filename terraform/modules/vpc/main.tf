resource "yandex_vpc_network" "app-network" {
  name = "reddit-app-network-${var.env}"
}

resource "yandex_vpc_subnet" "app-subnet" {
  name           = "reddit-app-subnet-${var.env}"
  zone           = var.zone
  network_id     = yandex_vpc_network.app-network.id
  v4_cidr_blocks = var.v4cidr
}
