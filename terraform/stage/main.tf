provider "yandex" {
  service_account_key_file = file("~/.ssh/otus/ya_sa_key.json")
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  zone                     = var.zone
}

module "vpc" {
  source = "../modules/vpc"
  zone   = var.zone
  env    = var.env
}

module "app" {
  source          = "../modules/app"
  env             = var.env
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
  db_ext_address  = module.db.external_ip_address_db
  instance_resources = [
    {
      res_cpu       = 2,
      res_mem       = 1,
      core_fraction = 5
    }
  ]
  instance_boot_disk = [
    {
      size = 20
      type = "network-hdd"
    }
  ]
  # instance_secondary_disk = []
  depends_on = [module.vpc, module.db]
}
module "db" {
  source          = "../modules/db"
  env             = var.env
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
  instance_resources = [
    {
      res_cpu       = 2,
      res_mem       = 1,
      core_fraction = 5
    }
  ]
  instance_boot_disk = [
    {
      size = 20
      type = "network-hdd"
    }
  ]
  # instance_secondary_disk = []
  depends_on = [module.vpc]
}
