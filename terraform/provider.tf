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
  subscription_id = "76ac7853-64f7-4ae7-97f6-e0ace42c6322"
}

