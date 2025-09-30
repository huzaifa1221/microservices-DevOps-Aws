terraform {
  backend "s3" {
    bucket         = "microservices-tf-buckett"
    key            = "tfstate"
    region         = "us-east-1"
  }
}