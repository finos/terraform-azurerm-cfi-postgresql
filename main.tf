#Azure resource manager provider
provider "azurerm" {
  version = "3.41.0"
  features {}
}
#Set the backend to be Azure storage
terraform {
  backend "azurerm" {
    key = "terraform.tfstate"
  }
}
