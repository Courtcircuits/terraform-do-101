variable "region" {
  description = "The AWS region to deploy resources."
  default     = "us-east-1"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}
