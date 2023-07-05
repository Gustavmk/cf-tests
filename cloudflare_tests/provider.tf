terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

}

provider "azurerm" {
  features {}

}

provider "cloudflare" {
  email   = data.azurerm_key_vault_secret.cloudflare-email.value
  api_key = data.azurerm_key_vault_secret.cloudflare-token.value
}
