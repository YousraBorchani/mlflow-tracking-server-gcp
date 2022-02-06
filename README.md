 Steps
    1.Create the infrastructural elements (terraform):
      - GKE https://learn.hashicorp.com/tutorials/terraform/gke 
      - Deploy MLFlow with a remote backend (Cloud SQL PostgreSQL) and artifact store (Google Cloud Storage)
       



    2.Deployment
    Create a docker image for the MLFlow tracking server.
    Create YAML configurations for deployment, service and configmap to deploy the tracking server to Kubernetes.

