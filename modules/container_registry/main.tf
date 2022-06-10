resource "random_pet" "prefix" {}

resource "azurerm_container_registry" "acr" {
  name                = "${random_pet.prefix.id}-acr"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  tags                = var.tags
}