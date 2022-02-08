## MLflow 

To deploy the infrastructure we will use mlflow helm chart to start the tracker server on kubernetes engine GKE. 
We will use Google Cloud SQL as the backend to store experiment metadata and Google Cloud Storage as artifact store.
All the choices are made with the following architecrture rules:
 1. Ensure high availability of the plateform. 
 2. Don't put data inside kubernetes.
 3. Use managed sever when it's possible.
 4. Portability.
  
![ View architecture here ](https://drive.google.com/file/d/1afmQAVEHmQG0Ye4NtXYmvulpXRjSKmF1/view?usp=sharing)
![This is an image](https://myoctocat.com/assets/images/base-octocat.svg)


## Set up the environment

`gcloud auth application-default login`

## Run Terraform 

```
terraform init
terraform plan
terraform apply

```

## Run kubernetes

`kubectl get ingress mlflow-release -o jsonpath="{.status.loadBalancer.ingress[0].ip}"`

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 2.16.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.60 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.7.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.10.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gcs"></a> [gcs](#module\_gcs) | ./modules/gcs | n/a |
| <a name="module_gke"></a> [gke](#module\_gke) | ./modules/gke | n/a |
| <a name="module_mlflow"></a> [mlflow](#module\_mlflow) | ./modules/mlflow | n/a |
| <a name="module_postgres"></a> [postgres](#module\_postgres) | ./modules/postgresql_ha | n/a |

## Resources

| Name | Type |
|------|------|
| [random_id.bucket_id](https://registry.terraform.io/providers/hashicorp/random/3.1.0/docs/resources/id) | resource |
| [google_client_config.provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name_prefix"></a> [bucket\_name\_prefix](#input\_bucket\_name\_prefix) | bucket name prefix | `string` | n/a | yes |
| <a name="input_heml-release-chart"></a> [heml-release-chart](#input\_heml-release-chart) | heml release chart | `string` | n/a | yes |
| <a name="input_heml-release-name"></a> [heml-release-name](#input\_heml-release-name) | heml release name | `string` | n/a | yes |
| <a name="input_heml-release-repository"></a> [heml-release-repository](#input\_heml-release-repository) | heml release repository | `string` | n/a | yes |
| <a name="input_ingress_enabled"></a> [ingress\_enabled](#input\_ingress\_enabled) | ingress enabled | `string` | n/a | yes |
| <a name="input_ingress_path"></a> [ingress\_path](#input\_ingress\_path) | ingress path | `string` | n/a | yes |
| <a name="input_pg_database"></a> [pg\_database](#input\_pg\_database) | Database name of SQL instance. | `string` | n/a | yes |
| <a name="input_pg_port"></a> [pg\_port](#input\_pg\_port) | Port of the SQL instance. | `string` | n/a | yes |
| <a name="input_pg_user_name"></a> [pg\_user\_name](#input\_pg\_user\_name) | user name of the SQL instance. | `string` | n/a | yes |
| <a name="input_pg_user_password"></a> [pg\_user\_password](#input\_pg\_user\_password) | user password of the SQL instance. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | project id | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | region | `string` | n/a | yes |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | service port | `string` | n/a | yes |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | service type | `string` | n/a | yes |
| <a name="input_subnet_cidr_range"></a> [subnet\_cidr\_range](#input\_subnet\_cidr\_range) | subnet cidr range. | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubernetes_cluster"></a> [kubernetes\_cluster](#output\_kubernetes\_cluster) | n/a |
