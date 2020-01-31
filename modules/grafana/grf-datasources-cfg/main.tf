###########
# Providers
###########

provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

#locals {
#  grf_idb_provider       = "influxdb"
#  idb_datasource_counter = length(var.idb_datasources)
#}
#
#
############
## Resources
############
#
#resource "grafana_data_source" "idb" {
#  count         = idb_datasource_counter
#  type          = local.grf_idb_provider
#  name          = "influxdb-internal"
#  url           = var.idb_url
#  database_name = "_internal"
#}
