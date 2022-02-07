provider "helm" {
   kubernetes {

        host    = var.k8s_host
        token   = var.k8s_token
        cluster_ca_certificate = var.k8s_cluster_ca_certificate
 }
}


resource "helm_release" "mlflow" {
  name       =  var.heml-release-name
  repository =  var.heml-release-repository
  chart      =  var.heml-release-chart

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

  set {
    name = "service.type"
    value = var.metadata_service.type
  }

  set {
    name = "service.port"
    value = var.metadata_service.port
  }
  
  set {
    name = "ingress.enabled"
    value = var.metadata_ingress.enabled
  }

 /* set {
    name = "ingress.hosts[0].host"
    value = var.metadata_ingress.host
  }  */

  set {
    name = "ingress.hosts[0].paths[0].path"
    value = var.metadata_ingress.path
  }

  set {
    name = "ingress.hosts[0].paths[0].serviceNameOverride"
    value = var.metadata_ingress.serviceNameOverride
  }
  set {
    name = "ingress.hosts[0].paths[0].servicePortOverride"
    value = var.metadata_ingress.servicePortOverride
  }
      
}