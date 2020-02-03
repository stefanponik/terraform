###############
# ENV Variables
###############


grf_url  = "http://172.17.4.20:3000"
grf_auth = "admin:Password1"

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
    is_default    = false
  },
]

elk_url = "http://172.17.4.145:9200"

elk_datasources = [
  {
    name          = "elk-dev"
    database_name = "logstash*"
    is_default    = false
  },
]
