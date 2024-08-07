# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.myname
  location = var.loc
}

resource "azurerm_network_security_group" "rg" {
  name                = "example-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_virtual_network" "rg" {
  name                = "example-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.address_space 
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.rg.id
  }

  tags = {
    environment = "Test"
  }
}

variable "myname" {
  type    = string
  default = "frankTFResourceGroup"
}

# this is now an "input" value 
variable "loc" {
  type    = string
  default = "westus2"
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}


