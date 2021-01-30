terraform {
  backend "s3" {
    endpoint          = "storage.yandexcloud.net"
    bucket            = "terraform-otus"
    region            = "us-east-1"
    key               = "stage/terraform.tfstate"
    dynamodb_table    = "tf_lock_stage"
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g9km5jt6k903v0qovb/etn0318vumm6k20qqk26"

    skip_region_validation      = true
    skip_credentials_validation = true
    shared_credentials_file     = "~/.ssh/otus/backend_stage.key"
  }
}
