terraform {
  source = "${get_parent_terragrunt_dir()}/../../modules/aks"
}

include {
  path = find_in_parent_folders()
}

resource "action_group_id" "example" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}

resource "container_registry" "example" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}

resource "container_registry" "example" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}

resource "service_principal" "helm" {
  client_id = var.client_id
  tags = var.tags
}

resource "key_vault" "example" {
  tenant_id = var.tenant_id
  object_id = var.object_id
  tags = var.tags
  resource_group_name = var.resource_group_name
  location = var.location
}

resource "log_analytics_workspace" "law" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}

resource "networking" "net" {
  resource_group_name = var.resource_group_name
  location = var.location
  tags = var.tags
}

inputs = {
  action_group_id = action_group_id.example.id
  container_registry_id = container_registry.example.id
  helm_service_principal_object_id = service_principal.helm.id 
  key_vault_id = key_vault.example.id
  log_analytics_workspace_id = log_analytics_workspace.law.id
  outbound_ip_address_ids = [networking.azurerm_public_ip.id]
}