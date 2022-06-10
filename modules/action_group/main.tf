resource "random_pet" "prefix" {}

resource "azurerm_monitor_action_group" "example" {
  name                = "${random_pet.prefix.id}-action"
  resource_group_name = var.resource_group_name
  short_name          = "p0action"
  tags                = var.tags
}
