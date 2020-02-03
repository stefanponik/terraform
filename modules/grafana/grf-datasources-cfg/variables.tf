###############
# Variables
###############

variable "grf_url" {
}

variable "grf_auth" {
}

variable "idb_url" {
}

variable "idb_datasources" {
  type = list(object({
    name          = string
    database_name = string
    is_default    = bool
  }))
}
