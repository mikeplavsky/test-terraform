provider "azurerm" {}

resource "azurerm_resource_group" "mp_terraform" {
    name = "terraform"
    location = "West US"
    tags = {"product" = "rmaz", "platform" = "mmp"}
}
