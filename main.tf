terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0."
    }
  }
}

resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "my-context"
}

data "terraform_remote_state" "aks" {
  backend = "local"

  config = {
    path = "../learn-terraform-provision-aks-cluster/terraform.tfstate"
  }
}


resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-rg"
  location = "Germany West Central"

  tags = {
    environment = "Demo"
  }
}


data "azuread_client_config" "current" {}

resource "azuread_application" "example" {
  display_name = "example"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "example" {
  application_id               = azuread_application.example.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
