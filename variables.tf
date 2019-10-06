provider "aws" {  
  region = "us-west-2"
  access_key = ""
  secret_key = ""
}

terraform {
  backend "s3" {
    bucket = "test-bucket-demo"
    region = "us-west-2"
  }
}
locals {
  environment = "Demo-cp-test"
  service     = "Trend-Ftp-S3"
}
