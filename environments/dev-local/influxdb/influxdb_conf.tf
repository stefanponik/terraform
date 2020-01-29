# Variables
variable "idb_url" {
}

variable "idb_default_db" {
}


# Provider
provider "influxdb" {
  url = var.idb_url
}

# Resources
resource "influxdb_database" "metric_store" {
  name = var.idb_default_db
}

#resource "influxdb_database" "metric_store_policies" {
#  name = var.idb_default_db
#
#}
