###########
# Providers
###########

provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

resource "grafana_data_source" "idb" {
  type          = "influxdb"
  name          = "influxdb-internal"
  url           = var.idb_url
  database_name = "_internal"
}