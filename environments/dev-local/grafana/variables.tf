###############
# Variables
###############

variable "grf_url" {
}

variable "grf_auth" {
}

variable "idb_url" {
}

variable "elk_url" {
}

variable "idb_datasources" {
  type = list(object({
    name          = string
    database_name = string
    is_default    = bool
  }))
}

variable "elk_datasources" {
  type = list(object({
    name          = string
    is_default    = bool
    database_name = string
  }))
}
