terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.58.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ba0b20ad-8e5c-46a3-935a-06c38c9ce67e"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tolu-rg"
    storage_account_name = "tolustorage123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}