#########
# Backend
#########
terraform {
  backend "local" {
    path = ".terraform/tf-state/terraform.tfstate"
  }
}
