
#########
# Modules 
#########

module "grf-datasources-cfg" {
  source = "../../../modules/grafana/grf-datasources-cfg"

  grf_url         = var.grf_url
  idb_url         = var.idb_url
  elk_url         = var.elk_url
  idb_datasources = var.idb_datasources
  elk_datasources = var.elk_datasources
}

