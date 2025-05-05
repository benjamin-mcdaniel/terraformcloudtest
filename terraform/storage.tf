# Storage Account (Free tier within usage limits)
resource "azurerm_storage_account" "dev_engie_storage" {
  name                     = "devengiestorageacc"
  resource_group_name      = azurerm_resource_group.dev_engie_rg.name
  location                 = azurerm_resource_group.dev_engie_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  # Enable some free features
  min_tls_version           = "TLS1_2"
  
  tags = {
    environment = "dev"
    project     = "dev-engie"
  }
}