
###################
# Grafana Variables
###################

grf_folders [
  "Docker_Infra",
  "Monitoring_Infra",
  "VMware_Infra",
]

grf_dashboards [
{ Monitoring_Infra = "./dashboards/Docker-overview-type-1.json" },
{ Monitoring_Infra = "./dashboards/InfluxDB-Docker-type-1.json" },
{ Docker_Infra = "./dashboards/Docker-overview-type-1.json" },
{ Docker_Infra = "./dashboards/InfluxDB-Docker-type-1.json" },
]

