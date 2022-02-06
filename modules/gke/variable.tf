variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "subnet_cidr_range" {
  description = "subnet cidr range."
  type        = string
}