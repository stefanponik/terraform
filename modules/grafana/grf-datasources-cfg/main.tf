###########
# Providers
###########

provider "grafana" {
  url  = var.grf_url
  auth = var.grf_auth
}

provider "restapi" {
  uri                  = var.grf_url
  username             = "admin"
  password             = "Password1"
  write_returns_object = true
}

########
# Locals
########

locals {
  grf_idb_provider       = "influxdb"
  grf_elk_provider       = "elasticsearch"
  idb_datasource_counter = length(var.idb_datasources)
  elk_datasource_counter = length(var.elk_datasources)
  elk_defaults = {
    type   = local.grf_elk_provider,
    access = "proxy",
    url    = var.elk_url,
  }
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
  is_default    = lookup(element(var.idb_datasources, count.index), "is_default")
}

resource "restapi_object" "api-elk-dev" {
  count = local.elk_datasource_counter
  path  = "/api/datasources"
  data  = jsonencode(merge(var.elk_datasources[count.index], local.elk_defaults))
}
