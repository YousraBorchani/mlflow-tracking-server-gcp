variable "project_id" {
  type        = string
  description = "The project to run tests against"
}

variable "pg_ha_name" {
  type        = string
  description = "The name for Cloud SQL instance"
  default     = "tf-pg-ha"
}

variable "pg_ha_external_ip_range" {
  type        = string
  description = "The ip range to allow connecting from/to Cloud SQL"
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "vpc_id" {
  description = "VPC id."
  type        = string
}


variable "labels" {
  description = "Labels to assign on the SQL instance."
  type        = map
  default = {}
}

variable "user_name" {
  description = "user name of the SQL instance."
  type        = string
}

variable "user_password" {
  description = "user password of the SQL instance."
  type        = string
}

variable "region" {
  description = "region"
  type = string
}