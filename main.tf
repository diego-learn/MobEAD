
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
  name     = "rg-moead"
  location = "westus2"
}



resource   "azurerm_windows_virtual_machine"   "example"   {
  name                    =   "myvm1"
  location                =   "northeurope"
  resource_group_name     =   azurerm_resource_group.rg.name
  network_interface_ids   =   []
  size                    =   "Standard_B1s"
  admin_username          =   "adminuser"
  admin_password          =   "Password123!"

  source_image_reference   {
    publisher   =   "MicrosoftWindowsServer"
    offer       =   "WindowsServer"
    sku         =   "2019-Datacenter"
    version     =   "latest"
  }

  os_disk   {
    caching             =   "ReadWrite"
    storage_account_type   =   "Standard_LRS"
  }
}
