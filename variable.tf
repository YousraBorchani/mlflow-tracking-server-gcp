variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "bucket_name_prefix" {
  description = "region"
  type = string
}

variable "user_name" {
  description = "user name of the SQL instance."
  type        = string
}

variable "user_password" {
  description = "user password of the SQL instance."
  type        = string
}


variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "subnet_cidr_range" {
  description = "subnet cidr range."
  type        = string
}
