output "azurerm_public_ip" {
    value = azurerm_public_ip.example
    description = "The newly created public IP object"
}
output "azurerm_virtual_network" {
    value = azurerm_virtual_network.example
    description = "The newly created Virtual Network"
}
output "azurerm_subnet" {
    value = azurerm_subnet.example
    description = "The newly created Subnet inside the virtual network"
}