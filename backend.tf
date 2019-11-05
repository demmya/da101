terraform {
  backend "s3" {
    bucket = "gidisync-terraform-backup"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}