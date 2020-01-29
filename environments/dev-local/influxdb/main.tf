##########
# Provider
##########

provider "influxdb" {
  url = var.idb_url
}

resource "influxdb_database" "internaldb" {
  name = "_internal"
  # retention_policies {
  #   name     = "monitor"
  #   duration = "4w"
  #   default  = false
  # }
  # It does not update existing policy value for monitor (not desire state of behavior)
}
###########
# Resources
###########
resource "influxdb_database" "metric_store_db" {
  name = var.idb_default_db
  retention_policies {
    name     = "dev-local-policy"
    duration = "52w"
    default  = true
  }
  #retention_policies {
  #  name     = "test1"
  #  duration = "4w"
  #  default  = false
  #}
}

#resource "influxdb_database" "metric_store_policies" {
#  name = var.idb_default_db
#
#}
