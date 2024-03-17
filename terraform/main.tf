terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  required_version = ">= 0.14"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "grc-rg" {
  name     = "grc-rg-cp2"
  location = var.location

  tags = {
    environment = "CP2"
  }
}

resource "azurerm_storage_account" "grc-sa" {
  name                     = "grcstaccountcp2"
  resource_group_name      = azurerm_resource_group.grc-rg.name
  location                 = azurerm_resource_group.grc-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "CP2"
  }
}

