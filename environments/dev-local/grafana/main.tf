#########
# Modules 
#########

#module "grf-datasources-cfg" {
#  source = "../../../modules/grafana/grf-datasources-cfg"
#
#  idb_url         = var.idb_url
#  grf_url         = var.grf_url
#  grf_auth        = var.grf_auth
#  idb_datasources = var.idb_datasources
#}

provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

locals {
  grf_idb_provider       = "influxdb"
  grf_elk_provider       = "elasticsearch"
  idb_datasource_counter = length(var.idb_datasources)
  elk_datasource_counter = length(var.elk_datasources)
}

resource "grafana_data_source" "idb" {
  count = local.idb_datasource_counter

  type          = local.grf_idb_provider
  name          = lookup(element(var.idb_datasources, count.index), "name")
  url           = var.idb_url
  database_name = lookup(element(var.idb_datasources, count.index), "database_name")
  is_default    = lookup(element(var.idb_datasources, count.index), "is_default")
}

#resource "grafana_data_source" "elk" {
#  count = local.elk_datasource_counter
#
#  type          = local.grf_elk_provider
#  name          = lookup(element(var.elk_datasources, count.index), "name")
#  url           = var.elk_url
#  is_default    = lookup(element(var.elk_datasources, count.index), "is_default")
#  database_name = lookup(element(var.elk_datasources, count.index), "database_name")
#}

provider "restapi" {
  uri                  = var.grf_url
  username             = "admin"
  password             = "Password1"
  write_returns_object = true
}

#data "restapi_object" "get-api-elk-dev" {
#  path         = "/api/datasources"
#  search_key   = "name"
#  search_value = "elk-dev"
#}

resource "restapi_object" "api-elk-dev" {
  path = "/api/datasources"
  #  update_path = "/api/datasources/10"
  data = "{\"name\":\"elk-dev\",\"type\":\"elasticsearch\",\"access\":\"proxy\",\"url\":\"http:\\/\\/172.17.4.145:9200\",\"database\":\"logstash*\",\"jsonData\":{\"esVersion\":60,\"maxConcurrentShardRequests\":\"3\",\"timeField\":\"@timestamp\",\"timeInterval\":\"60s\"}}"
}
