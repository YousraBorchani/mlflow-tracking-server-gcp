locals {
  read_replica_ip_configuration = {
    ipv4_enabled    = true
    require_ssl     = false
    private_network = null
    authorized_networks = [
      {
        name  = "${var.project_id}-cidr"
        value = var.pg_ha_external_ip_range
      },
    ]
  }
}


module "postgresql" {
  source               = "github.com/terraform-google-modules/terraform-google-sql-db/modules/postgresql"
  name                 = var.pg_ha_name
  random_instance_name = true
  project_id           = var.project_id
  database_version     = "POSTGRES_9_6"
  region               = var.region
  user_name            = var.user_name
  user_password        = var.user_password

  // Master configurations
  tier                            = "db-custom-2-13312"
  zone                            = "${ var.region }-c"
  availability_type               = "REGIONAL"
  maintenance_window_day          = 7
  maintenance_window_hour         = 12
  maintenance_window_update_track = "stable"

  deletion_protection = false

  database_flags = [{ name = "autovacuum", value = "off" }]

  user_labels = {
    foo = "bar"
  }

  ip_configuration = {
    ipv4_enabled    = true
    require_ssl     = true
    private_network = null
    authorized_networks = [
      {
        name  = "${var.project_id}-cidr"
        value = var.pg_ha_external_ip_range
      },
    ]
  }

  backup_configuration = {
    enabled                        = true
    start_time                     = "20:55"
    location                       = null
    point_in_time_recovery_enabled = false
    transaction_log_retention_days = null
    retained_backups               = 365
    retention_unit                 = "COUNT"
  }

  // Read replica configurations
  read_replica_name_suffix = "-read"
  read_replicas = [
    {
      name                = "0"
      zone                = "${ var.region }-d"
      tier                = "db-custom-2-13312"
      ip_configuration    = local.read_replica_ip_configuration
      database_flags      = [{ name = "autovacuum", value = "off" }]
      disk_autoresize     = null
      disk_size           = null
      disk_type           = "PD_HDD"
      user_labels         = var.labels
      encryption_key_name = null
    },
    {
      name                = "2"
      zone                = "${ var.region }-c"
      tier                = "db-custom-2-13312"
      ip_configuration    = local.read_replica_ip_configuration
      database_flags      = [{ name = "autovacuum", value = "off" }]
      disk_autoresize     = null
      disk_size           = null
      disk_type           = "PD_HDD"
      user_labels         = var.labels
      encryption_key_name = null
    },
  ]

  db_name      = var.pg_ha_name
  db_charset   = "UTF8"
  db_collation = "en_US.UTF8"

  additional_databases = [
    {
      name      = "${var.pg_ha_name}-additional"
      charset   = "UTF8"
      collation = "en_US.UTF8"
    },
  ]


}