terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      find_in_parent_folders("regional.tfvars"),
    ]

  }

  extra_arguments "disable_input" {
    commands  = get_terraform_commands_that_need_input()
    arguments = ["-input=false"]
  }
}

generate "main_providers" {
  path      = "main_providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "azurerm" {
    features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = var.resource_group_name
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
resource "azurerm_resource_group" "AutomationGroup" {
  name     = var.resource_group_name
  location = var.location
  tags = var.tags
}
# VARIABLES
variable "resource_group_name" {
    type        = string
    description = "The resource_group_name to localize resource creation to"
}
variable "location" {
    type        = string
    description = "The Azure region to start creating resources in"
}
variable "tags" {
    type = map(string)
    description = "A key value map containing resource tags"
}
EOF
}