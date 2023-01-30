terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "demorg"
    storage_account_name = "demorgtfstore"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
    use_oidc             = true
    access_key           = "ZSdK6JS6S8xnn1V7LgL31lZmHB42GLAmwIBwe3r3yNqNkP58wfnjigIH77VuAolhI4wb7qQpUNqO+AStA1f2kA=="
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}
