terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = "arn:aws:iam::975050161001:role/LabRole"
  }
}

module "s3" {
  source        = "./modules/s3"
  bucket_name   = var.bucket_name
  random_string = module.random_string.string
}

module "random_string" {
  source = "./modules/random_string"
  length = var.random_string_length
}
