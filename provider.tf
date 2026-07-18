terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "TestRG"
    storage_account_name = "testbackendsa"
    container_name       = "testsc"
    key                  = "terraform20260717.tfstate"
    subscription_id      = "b197523b-6a83-4a07-8922-3be74b9d39be"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b197523b-6a83-4a07-8922-3be74b9d39be"
}