#########
# Modules 
#########

module "grf-datasources-cfg" {
  source = "../../../modules/grafana/grf-datasources-cfg"

  idb_url  = var.idb_url
  grf_url  = var.grf_url
  grf_auth = var.grf_auth

}
