###############
# Variables
###############

variable "grf_url" {
  type = string
}


variable "grf_user" {
  type    = string
  default = "admin"
}

variable "grf_password" {
  type    = string
  default = "Password1"
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
