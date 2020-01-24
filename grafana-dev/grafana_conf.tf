# VARIABLES

variable "grf_url" {
#  default = "http://localhost:3000"
}
variable "grf_auth" {
#  default = "eyJrIjoic25uOFpHVWVoaTJCM0hhN1BiNzBpUEhseEVINmhiWjAiLCJuIjoiYWRtaW4iLCJpZCI6MX0="
}
variable "idb_url" {
#  default = "http://influxdb-dev-local:8086"  
}

# PROVIDER

provider "grafana" {
  url   = var.grf_url
  auth  = var.grf_auth
}

resource "grafana_data_source" "idb" {
  type          = "influxdb"
  name          = "influxdb-internal1"
  url           = var.idb_url
  database_name = "_internal"
}