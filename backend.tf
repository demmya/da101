terraform {
  backend "s3" {
    bucket = "gidisync-terraform-backup"
    key    = "/infra/appserver/terraform.tfstate"
    region = "eu-west-1"
  }
}