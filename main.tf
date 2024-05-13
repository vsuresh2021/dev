# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  
}



resource "azurerm_virtual_network" "example1" {
  name                = "my-vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "Suresh-RG"
}

resource "azurerm_subnet" "example2" {
  name                 = "my-subnet2"
  resource_group_name  = "Suresh-RG"
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}
