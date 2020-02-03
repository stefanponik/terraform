#########
# Modules
#########

module "grf-datasources-cfg" {
  source          = "../../../modules/influxdb/idb-databases-cfg"
  idb_url         = var.idb_url
  database_schema = var.database_schema
}
