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
  }

  required_version = ">= 0.14"
}
