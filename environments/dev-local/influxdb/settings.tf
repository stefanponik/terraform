#########
# Backend
#########
terraform {
  backend "local" {
  }
  required_providers {
    influxdb = ">= 1.3"
  }
}
