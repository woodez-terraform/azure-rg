resource "azurerm_resource_group" "demo" {
  name     = var.project
  location = var.location
}
