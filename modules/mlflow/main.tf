provider "helm" {
   kubernetes {

        host     = var.k8s_host

        token             = var.k8s_token
        cluster_ca_certificate = var.k8s_cluster_ca_certificate
 }
}


resource "helm_release" "mlflow" {
  name       = "mlflow-release"
  repository = "https://larribas.me/helm-charts"
  chart      = "mlflow"

  set {
    name  = "backendStore.postgres.host"
    value = var.metadata_pg_storage.host
  }
  set {
    name  = "backendStore.postgres.port"
    value = var.metadata_pg_storage.port
  }
  set {
    name  = "backendStore.postgres.database"
    value = var.metadata_pg_storage.database
  }
  set {
    name  = "backendStore.postgres.username"
    value = var.metadata_pg_storage.username
  }
  set {
    name  = "backendStore.postgres.password"
    value = var.metadata_pg_storage.password
  }

  set {
    name  = "defaultArtifactRoot"
    value = var.artifacts_storage_url
  }
  
}