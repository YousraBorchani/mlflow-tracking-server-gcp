output "kubernetes_cluster" {
  value       = {
    k8s_host = module.gke.kubernetes_cluster.endpoint
  }
}


