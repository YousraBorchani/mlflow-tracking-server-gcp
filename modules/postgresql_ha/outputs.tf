output "name" {
  description = "The name for Cloud SQL instance"
  value       = module.postgresql.instance_name
}

output "replicas" {
  value = module.postgresql.replicas
}

output "instances" {
  value = module.postgresql.instances
}

output "public_ip_address" {
  description = "The first public (PRIMARY) IPv4 address assigned for the master instance"
  value       = module.postgresql.public_ip_address
}