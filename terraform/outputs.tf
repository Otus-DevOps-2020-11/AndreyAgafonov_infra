output "external_ip_address_app" {
  value = {
    for eia in yandex_compute_instance.app :
    eia.name => eia.network_interface.0.nat_ip_address
  }
}


output "external_address_lb" {
  #   value = yandex_lb_network_load_balancer.app.listener[0]
  value = [for v in yandex_lb_network_load_balancer.app.listener :
    [for w in v.external_address_spec :
  "http://${w.address}"].0].0
}
