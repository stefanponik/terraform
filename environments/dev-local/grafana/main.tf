
provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

# resource "grafana_data_source" "idb" {
#   type = "influxdb"
# 
#   for_each = var.grf-idb-datasources.default
# 
#   url = var.idb_url
# }

resource "grafana_data_source" "idb" {
  type          = "influxdb"
  name          = "influxdb-internal"
  url           = var.idb_url
  database_name = "_internal"
}
# 
# resource "grafana_data_source" "idb-2" {
#   type          = "influxdb"
#   name          = "influxdb-metricstore"
#   is_default    = true
#   url           = var.idb_url
#   database_name = "MetricStore"
# }


