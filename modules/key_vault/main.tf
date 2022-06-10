resource "random_pet" "prefix" {}

resource "azurerm_key_vault" "example" {
    name                 = "${random_pet.prefix.id}-keyvault"
    location             = var.location
    resource_group_name  = var.resource_group_name
    sku_name             = var.sku_name
    tenant_id            = var.tenant_id
    tags                 = var.tags 
}

resource "azurerm_key_vault_access_policy" "example" {
    key_vault_id          = azurerm_key_vault.example.id
    tenant_id             = var.tenant_id
    object_id             = var.object_id
    tags                  = var.tags 
}
