provider "google" {
  project = var.project_id
  region  = var.region
  credentials = "/home/smartskills04/.config/gcloud/application_default_credentials.json"
}

module "gke" {
    source = "./modules/gke"

    project_id = var.project_id
    region = var.region
    vpc_name = var.vpc_name
    subnet_cidr_range = var.subnet_cidr_range
}

resource "random_id" "bucket_id" {

  byte_length = 8
}

module "gcs" {
    source = "./modules/gcs"

    bucket_name  = "${var.bucket_name_prefix}-${ random_id.bucket_id.hex }"
    project_id   = var.project_id
    gcs_location = var.region
}

module "postgres" {
    source = "./modules/postgresql_ha"
    region = var.region
    user_name = var.user_name
    user_password = var.user_password
    project_id   = var.project_id
    vpc_name = var.vpc_name
    vpc_id = module.gke.vpc.id
    pg_ha_external_ip_range = "0.0.0.0/0"
    #pg_ha_external_ip_range = var.subnet_cidr_range
}


data "google_client_config" "provider" {

}


module "mlflow" {
    source = "./modules/mlflow"

    k8s_host = module.gke.kubernetes_cluster.endpoint
    k8s_cluster_ca_certificate = base64decode(module.gke.kubernetes_cluster.master_auth.0.cluster_ca_certificate)
    k8s_token = data.google_client_config.provider.access_token
    metadata_pg_storage = {
      username = var.user_name
      password = var.user_password
      host = module.postgres.public_ip_address
      port = "5432"
      database = "tf-pg-ha"
    }
    artifacts_storage_url = module.gcs.url

}