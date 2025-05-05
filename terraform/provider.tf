terraform {
  cloud {
    organization = "test-engie"

    workspaces {
      name = "test-engie"
    }
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Azure provider variables
variable "ARM_CLIENT_ID" {
  description = "The Azure Client ID (Service Principal)"
  type        = string
  sensitive   = true
}

variable "ARM_CLIENT_SECRET" {
  description = "The Azure Client Secret (Service Principal)"
  type        = string
  sensitive   = true
}

variable "ARM_SUBSCRIPTION_ID" {
  description = "The Azure Subscription ID"
  type        = string
  sensitive   = true
}

variable "ARM_TENANT_ID" {
  description = "The Azure Tenant ID"
  type        = string
  sensitive   = true
}

provider "azurerm" {
  features {}
}