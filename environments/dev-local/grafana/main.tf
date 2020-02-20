
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

provider "grafana" {
  url = var.grf_url
  #  auth = "${var.grf_user}:${var.grf_password}"
  auth = var.grf_api_key != "" ? var.grf_api_key : "${var.grf_user}:${var.grf_password}"
}

resource "grafana_folder" "folder_collection" {
  count = length(var.grf_folders)

  title = element(var.grf_folders, count.index)
}

output "all_grafana_folders_info" {
  value = grafana_folder.folder_collection
}

output "deployed_grafana_folders" {
  value = grafana_folder.folder_collection.*.title
}

locals {
  folder_name            = "Monitoring-Infra"
  grf_dashboards_counter = length(var.grf_dashboards)
}

resource "grafana_dashboard" "dashboard_in_folder" {

  count = local.grf_dashboards_counter

  folder      = element([for x in grafana_folder.folder_collection : x.id if x.title == keys(element(var.grf_dashboards, count.index))[0]], 0)
  config_json = file(values(element(var.grf_dashboards, count.index))[0])

}

#replace(file("./dashboards/Docker overview-eport-external-sharing-1.json"), "+", "influxdb-metricstore")
# Python and GO regex but not working as terraform using its own regex. 
# "(?:\\\${)?DS_[A-Z0-9_-]+(?:})"

# [for x in local.all_grafana_folders_info: x.id if x.title == local.folder_name ]
