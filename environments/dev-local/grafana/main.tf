
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
  grf_dashboards = [
    {
      grf_folder_name = "Docker-Infra"
      grf_folder_dashboards = [
        "../../../../grafana-dashboards/docker-dashboards/InfluxDB-Docker-type-2",
        "../../../../grafana-dashboards/docker-dashboards/Docker-overview-type-2.json",
      ]
    },
    {
      grf_folder_name = "Docker-Infra"
      grf_folder_dashboards = [
        "../../../../grafana-dashboards/docker-dashboards/InfluxDB-Docker-type-2",
        "../../../../grafana-dashboards/docker-dashboards/Docker-overview-type-2.json",
      ]
    },
  ]
}

resource "grafana_dashboard" "dashboard_in_folder" {
  # for_each = [ for x in   ]


  folder      = element([for x in grafana_folder.folder_collection : x.id if x.title == local.folder_name], 0)
  config_json = file("../../../../grafana-dashboards/docker-dashboards/Docker-overview-type-2.json")

}

#replace(file("./dashboards/Docker overview-eport-external-sharing-1.json"), "+", "influxdb-metricstore")
# Python and GO regex but not working as terraform using its own regex. 
# "(?:\\\${)?DS_[A-Z0-9_-]+(?:})"

# [for x in local.all_grafana_folders_info: x.id if x.title == local.folder_name ]
