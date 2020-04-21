provider "aws" {
  region  = "us-east-1"
  version = "~> 2.58"
}

terraform {
  backend "s3" {
    bucket = "learn-terraform-tfstate-terraform-lrx"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
