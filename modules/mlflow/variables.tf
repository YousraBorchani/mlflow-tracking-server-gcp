
variable "k8s_host" {
  type        = string
}

variable "k8s_token" {
  type        = string
}
variable "k8s_cluster_ca_certificate" {
  type        = string
}

variable "metadata_pg_storage" {
  type = object({
     username = string
     password = string
     host = string
     port = string
     database = string
  })
}
variable "artifacts_storage_url" {
  type = string
}
