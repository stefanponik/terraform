###############
# Variables
###############

variable "grf_url" {
  type = string
}

variable "idb_url" {
  type = string
}

variable "elk_url" {
  type = string
}

variable "idb_datasources" {
  type = list(object({
    name          = string
    database_name = string
    is_default    = bool
  }))
}

variable "elk_datasources" {
  type = list(any)
}
