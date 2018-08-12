provider "azurerm" {}

resource "azurerm_resource_group" "mp_terraform" {
    name = "terraform"
    location = "West US"
    tags = {
        "product" = "rmaz", 
        "platform" = "mmp"}}

resource "azurerm_eventgrid_topic" "mp_eventgrid" {
    name = "mp-eventgrid"
    location = "${azurerm_resource_group.mp_terraform.location}"
    resource_group_name = "${azurerm_resource_group.mp_terraform.name}"
}
