provider "yandex" {
  service_account_key_file = file("~/.ssh/otus/ya_sa_key.json")
  folder_id                = var.folder_id
  cloud_id                 = var.cloud_id
  zone                     = var.zone
}

module "vpc" {
  source = "./modules/vpc"
  zone   = var.zone
}

module "app" {
  source                             = "./modules/app"
  public_key_path                    = var.public_key_path
  app_disk_image                     = var.app_disk_image
  subnet_id                          = module.vpc.vpc_subnet_id
  instance_allow_stopping_for_update = true
  instance_resources = [
    {
      res_cpu       = 2,
      res_mem       = 4,
      core_fraction = 100
    }
  ]
  instance_boot_disk = [
    {
      name     = "root"
      image_id = "windows" //ubuntu or windows
      size     = 100
      type     = "network-ssd"
  }]


  depends_on = [module.vpc]
}
module "db" {
  source          = "./modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = module.vpc.vpc_subnet_id
  depends_on      = [module.vpc]
}
