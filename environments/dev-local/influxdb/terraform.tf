#########
# Backend
#########
terraform {
  required_version = ">= 0.12.0"
  backend "local" {
  }
  required_providers {
    influxdb = ">= 1.3"
  }
}
