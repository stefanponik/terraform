###########
# Variables
###########

variable "idb_url" {
  type = string
}

variable "idb_datasources" {
  type = list(object({
    name          = string
    database_name = list(object({}))
  }))
}
