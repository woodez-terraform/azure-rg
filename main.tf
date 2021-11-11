terraform {
  backend "pg" {
      conn_str="postgres://tf_user:jandrew28@192.168.2.213/terraform_backend?sslmode=disable"
  }  
}

# provider
provider "azurerm" {
#  version = "2.46.0"
  features {}
}