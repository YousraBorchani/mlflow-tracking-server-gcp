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

variable "heml-release-name" {
  type = string
}
variable "heml-release-repository" {
  type = string
}
variable "heml-release-chart" {
  type = string
}

variable "metadata_service" {
  type = object ({
    type = string 
    port = string
  })
}

variable "metadata_ingress" {
  type = object ({
    enabled = string
    path = string
    serviceNameOverride = string
    servicePortOverride = string
   
  })
}