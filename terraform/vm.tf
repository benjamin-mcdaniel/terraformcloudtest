# Free tier B1s VM (note: While the VM itself is not free, B1s is the lowest cost option)
resource "azurerm_linux_virtual_machine" "dev_engie_vm" {
  name                  = "dev-engie-vm"
  resource_group_name   = azurerm_resource_group.dev_engie_rg.name
  location              = azurerm_resource_group.dev_engie_rg.location
  size                  = "Standard_B1s"  # Smallest VM size (low cost, but not free)
  admin_username        = "devengieadmin"
  network_interface_ids = [azurerm_network_interface.dev_engie_nic.id]

  admin_password                  = "P@ssw0rd1234!" # For testing only - use variables in production
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  tags = {
    environment = "dev"
    project     = "dev-engie"
  }
}