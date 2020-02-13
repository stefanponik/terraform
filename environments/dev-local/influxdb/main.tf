###########
# Providers 
###########

provider "influxdb" {
  url = var.idb_url
}

provider "influxdb" {
  alias    = "auth"
  url      = var.idb_url
  username = var.idb_username
  password = var.idb_password
}

#########
# Modules
#########

#module "terraform-influxdb-databases-cfg" {
#  source          = "github.com/stefanponik/terraform-influxdb-databases-cfg.git?ref=v0.0.1"
#  idb_url         = var.idb_url
#  database_schema = var.database_schema
#}

#This is purly to speed up development. 
#Clone actual module to the following folder called modules
module "grf-datasources-cfg" {
  source = "../../../../modules/terraform-influxdb-databases-cfg"
  providers = {
    influxdb = influxdb
  }
  database_schema = var.database_schema
}
