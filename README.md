# Terraform
Following repository is targeted fully to do RND and developing / testing initial concepts

All is developed and tested on MAC but should be working on Windows and Linux too. 

# Modules folder
Folder is designated to develop modules or clone actual modules from git and test moding them with redirecting source to local. 
Its workflow I find saves time when developing modules that are not yet in GIT or are in GIT and want to try new things out. 

## Examples modules folder

### Main.tf Root module/folder for deployment env.
    #########
    # Modules
    #########

    #module "terraform-influxdb-databases-cfg" {
    #  source          = "github.com/stefanponik/terraform-influxdb-databases-cfg.git?ref=v0.0.1"
    #  idb_url         = var.idb_url
    #  database_schema = var.database_schema
    #}


    # This is purly to speed up development. 
    # Clone actual module to the following folder called modules
    module "grf-datasources-cfg" {
      source          = "../../../modules/terraform-influxdb-databases-cfg"
      idb_url         = var.idb_url
      database_schema = var.database_schema
    }

## License

[MIT](https://github.com/stefanponik/terraform/blob/master/LICENSE)

