terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.51.0"
    }
  }
  required_version = ">= 1.5.0"
}

# AzureRM Provider
provider "azurerm" {
  features {}

  # Do NOT hardcode subscription or credentials here.
  # Azure DevOps pipeline injects them automatically as environment variables:
  # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID, ARM_SUBSCRIPTION_ID
}
