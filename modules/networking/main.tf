resource "random_pet" "prefix" {}

resource "azurerm_public_ip" "example" {
  allocation_method   = var.allocation_method
  location            = var.location
  name                = "${random_pet.prefix.id}-pubip"
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}
