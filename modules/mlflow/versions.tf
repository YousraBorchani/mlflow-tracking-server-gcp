terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.60"
    }
    docker = {
      source = "kreuzwerker/docker"
      version = "2.16.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.7.1"
    }
  }

  required_version = ">= 0.14"
}


