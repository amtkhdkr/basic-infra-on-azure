output "azurerm_key_vault" {
  value       = azurerm_key_vault.example
  description = "Azure Key vault object"
}

output "azurerm_key_vault_access_policy" {
  value       = azurerm_key_vault_access_policy.example
  description = "Azure Key vault Access Policy"
}
