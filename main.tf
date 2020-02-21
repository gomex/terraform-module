provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu
    bucket = "iaasweek-tfstates-terraform"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}