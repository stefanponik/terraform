###########
# Variables
###########

variable "grf_url" {
  type = string
}

variable "grf_auth" {
  type = string
}

variable "idb_url" {
  type = string
}

variable "idb_datasources" {
  type = list(object({
    name          = string
    database_name = string
  }))
}
