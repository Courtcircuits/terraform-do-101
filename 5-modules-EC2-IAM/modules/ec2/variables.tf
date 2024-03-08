variable "instance_name" {
  description = "The instance name"
  type        = string
}

variable "instance_type" {
  description = "The instance type"
  type        = string
}

variable "user_data" {
  description = "The user data"
  type        = string
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM instance profile"
  type        = string
}