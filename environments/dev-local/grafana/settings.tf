#########
# Backend
#########
terraform {
  backend "local" {
  }
    required_providers {
    grafana = ">= 1.5"
  }
}