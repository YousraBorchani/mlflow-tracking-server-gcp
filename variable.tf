variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "bucket_name_prefix" {
  description = "bucket name prefix"
  type = string
}

variable "pg_user_name" {
  description = "user name of the SQL instance."
  type        = string
}

variable "pg_user_password" {
  description = "user password of the SQL instance."
  type        = string
}

variable "pg_port" {
  description = "Port of the SQL instance."
  type        = string
}

variable "pg_database" {
  description = "Database name of SQL instance."
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

variable "heml-release-name" {
  description = "heml release name"
  type = string
}
variable "heml-release-repository" {
  description = "heml release repository"
  type = string
}
variable "heml-release-chart" {
  description = "heml release chart"
  type = string
}

variable "service_type" {
  description = "service type"
  type = string
}

variable "service_port" {
  description = "service port"
  type = string
}

variable "ingress_enabled" {
  description = "ingress enabled"
  type = string
}

variable "ingress_path" {
  description = "ingress path"
  type = string
}