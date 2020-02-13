###############
# ENV Variables
###############


grf_url = "http://localhost:3000"

grf_user     = "admin"
grf_password = "Password1"

# grf_api_key = "eyJrIjoieHdJQnpGU1h2NGp3dFNzbERhS0dncmx5RVRBNEdsMFgiLCJuIjoiYWRtaW4iLCJpZCI6MX0="

# Datasources URLs and Databases for  
idb_url = "http://influxdb-dev-local:8086"

idb_datasources = [
  {
    name          = "influxdb-internal"
    database_name = "_internal"
    is_default    = false
  },
  {
    name          = "influxdb-metricstore"
    database_name = "MetricStore"
    is_default    = true
  },
]

elk_url = "http://localhost:9200"

elk_datasources = [
  {
    name     = "elk-dev",
    database = "logstash*",
    jsonData = {
      esVersion                  = 60,
      maxConcurrentShardRequests = "3",
      timeField                  = "@timestamp",
      timeInterval               = "60s"
    },
  },
]

grf_folders = [
  "Docker-Infra",
  "Monitoring-Infra"
]


grf_dashboards = [
  {
    grf_folder_name = "Docker-Infra"
    grf_folder_dashboards = [
      "../../../../grafana-dashboards/docker-dashboards/Docker-overview-type-2.json",
      "../../../../grafana-dashboards/docker-dashboards/InfluxDB-Docker-type-2",
    ]
  },
  {
    grf_folder_name = "Docker-Infra"
    grf_folder_dashboards = [
      "../../../../grafana-dashboards/docker-dashboards/Docker-overview-type-2.json",
      "../../../../grafana-dashboards/docker-dashboards/InfluxDB-Docker-type-2",
    ]
  },
]
