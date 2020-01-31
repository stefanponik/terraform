###############
# ENV Variables
###############


grf_url  = "http://localhost:3000"
grf_auth = "admin/Password1"

# Datasources URLs and Databases for  
idb_url = "http://influxdb-dev-local:8086"

idb_datasources = [
  {
    name          = "influxdb-internal"
    database_name = "_internal"
  },
  {
    name          = "influxdb-metricstore"
    database_name = "MetricStore"
  },
]

