#Azure resource manager provider
provider "azurerm" {
  version = "4.0.1"
  features {}
}
#Set the backend to be Azure storage
terraform {
  backend "azurerm" {
    key = "terraform.tfstate"
  }
}
