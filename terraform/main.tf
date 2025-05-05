# Resource Group
resource "azurerm_resource_group" "dev_engie_rg" {
  name     = "dev-engie-resources"
  location = "East US"
}

# Network resources required for VM
resource "azurerm_virtual_network" "dev_engie_vnet" {
  name                = "dev-engie-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev_engie_rg.location
  resource_group_name = azurerm_resource_group.dev_engie_rg.name
}

resource "azurerm_subnet" "dev_engie_subnet" {
  name                 = "dev-engie-subnet"
  resource_group_name  = azurerm_resource_group.dev_engie_rg.name
  virtual_network_name = azurerm_virtual_network.dev_engie_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "dev_engie_nic" {
  name                = "dev-engie-nic"
  location            = azurerm_resource_group.dev_engie_rg.location
  resource_group_name = azurerm_resource_group.dev_engie_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.dev_engie_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Outputs
output "storage_account_name" {
  value = azurerm_storage_account.dev_engie_storage.name
}

output "storage_primary_access_key" {
  value     = azurerm_storage_account.dev_engie_storage.primary_access_key
  sensitive = true
}

output "vm_public_ip" {
  value = azurerm_network_interface.dev_engie_nic.private_ip_address
}
