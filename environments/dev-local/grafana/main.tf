#########
# Modules 
#########

#module "grf-datasources-cfg" {
#  source = "../../../modules/grafana/grf-datasources-cfg"
#
#  idb_url  = var.idb_url
#  grf_url  = var.grf_url
#  grf_auth = var.grf_auth
#
#}

provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

locals {
  grf_idb_provider       = "influxdb"
  idb_datasource_counter = length(var.idb_datasources)
}

###########
# Resources
###########

resource "grafana_data_source" "idb" {
  count = local.idb_datasource_counter

  type          = local.grf_idb_provider
  name          = lookup(element(var.idb_datasources, count.index), "name")
  url           = var.idb_url
  database_name = lookup(element(var.idb_datasources, count.index), "database_name")
}
