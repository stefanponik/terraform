
variable "grf_url" {
  default = "http://localhost:3000"
}

variable "grf_auth" {
  #  default = "eyJrIjoic25uOFpHVWVoaTJCM0hhN1BiNzBpUEhseEVINmhiWjAiLCJuIjoiYWRtaW4iLCJpZCI6MX0="
  default = eyJrIjoieEpGVmViTHh3YjZDTFlZNjV6dHRiRjNaMU1rUUdhWkkiLCJuIjoiYWRtaW4iLCJpZCI6MX0=
}

variable "idb_url" {
  default = "http://influxdb-dev-local:8086"
}

# Grafana Login info
# variable "grf_auth" {
#   grf_url  = "http://localhost:3000"
#   grf_auth = "eyJrIjoic25uOFpHVWVoaTJCM0hhN1BiNzBpUEhseEVINmhiWjAiLCJuIjoiYWRtaW4iLCJpZCI6MX0="
# }
# variable "idb_url" {
#   idb_url  = "http://influxdb-dev-local:8086"
# }
# variable "grf-idb-datasources" {
#   default = [
#   {
#     name = "influxdb-internal"
#     database_name = "_internal"
#   },
#   {
#     name = "influxdb-metricstore"
#     database_name = "MetricStore"
#   },
#   ] 
# }



