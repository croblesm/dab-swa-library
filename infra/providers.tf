terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.66.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # PM subscription
  subscription_id = "fa58cf66-caaf-4ba9-875d-f310d3694845"
}