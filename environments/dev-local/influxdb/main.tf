#########
# Modules
#########
variable "policy_list" {
  default = {
    db_name = "testdb3"
    db_policies = [
      {
        name     = "test1"
        duration = "2w"
        default  = true
      },
      {
        name     = "test2"
        duration = "4w"
        default  = false
      },
    ]
    db_name = "testdb4"
    db_policies = [
      {
        name     = "test1"
        duration = "2w"
        default  = true
      },
      {
        name     = "test2"
        duration = "4w"
        default  = false
      },
    ]
  }
}


module "grf-datasources-cfg" {
  source = "../../../modules/influxdb/idb-databases-cfg"

  idb_url = var.idb_url

}

#resource "influxdb_database" "internaldb" {
#  name = "_internal"
#  # retention_policies {
#  #   name     = "monitor"
#  #   duration = "4w"
#  #   default  = false
#  # }
#}

###########
# Resources
###########
resource "influxdb_database" "metric_store_db" {
  for_each = var.policy_list
  name     = each.value
  #  dynamic "retention_policies" {
  #    for_each = [for p in var.policy_list : {
  #      name     = p.name
  #      duration = p.duration
  #      default  = p.default
  #    }]
  #
  #    content {
  #      name     = retention_policies.value.name
  #      duration = retention_policies.value.duration
  #      default  = retention_policies.value.default
  #    }
  #  }
}

#resource "influxdb_database" "metric_store_policies" {
#  name = var.idb_default_db
#
#}
