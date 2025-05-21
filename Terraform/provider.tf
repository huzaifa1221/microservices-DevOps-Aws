provider "aws" {
  region = var.region
}

terraform {
  required_version = ">= 0.12"
}

terraform {
  backend "s3" {
    bucket         = "microservices-tf-bucket"
    key            = "tfstate"
    region         = "us-east-1"
  }
}