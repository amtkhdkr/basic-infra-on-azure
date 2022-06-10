resource "random_pet" "prefix" {}

resource "azurerm_log_analytics_workspace" "example" {
    location             = var.location
    name                 = "${random_pet.prefix.id}-lawspace"
    resource_group_name  = var.resource_group_name
    tags                 = var.tags 
}
