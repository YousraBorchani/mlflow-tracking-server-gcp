project_id = "ml-project-340322"
region     = "europe-west1"
bucket_name_prefix = "mlflow-storage"
pg_user_name = "admin"
pg_user_password = "admin"
pg_port= "5432"
pg_database = "tf-pg-ha" 
vpc_name = "ml-project-340322-vpc"
subnet_cidr_range = "10.10.0.0/24"
heml-release-name = "mlflow-release"
heml-release-repository = "https://larribas.me/helm-charts"  
heml-release-chart = "mlflow"
service_type = "NodePort"
service_port = "5000"
ingress_enabled = "true"
ingress_path = "/*"



