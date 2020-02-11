#########
# Modules
#########

module "terraform-influxdb-databases-cfg" {
  source          = "github.com/stefanponik/terraform-influxdb-databases-cfg.git?ref=v0.0.1"
  idb_url         = var.idb_url
  database_schema = var.database_schema
}


# This is purly to speed up development. 
# Clone actual module to the following folder called modules
# module "grf-datasources-cfg" {
#   source          = "../../../modules/terraform-influxdb-databases-cfg"
#   idb_url         = var.idb_url
#   database_schema = var.database_schema
# }
