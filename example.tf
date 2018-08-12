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

resource "azurerm_log_analytics_workspace" "mp_la" {
    
    name = "mp-la"
    location = "eastus"
    resource_group_name = "${azurerm_resource_group.mp_terraform.name}"
    sku = "Standard"

}

resource "azurerm_log_analytics_solution" "mp_la_solution" {

    solution_name = "Containers"	
    location = "eastus"
    resource_group_name = "${azurerm_resource_group.mp_terraform.name}"
    workspace_resource_id = "${azurerm_log_analytics_workspace.mp_la.id}"
    workspace_name = "${azurerm_log_analytics_workspace.mp_la.name}"
   
    plan = {
        publisher = "Microsoft"
        product = "OMSGallery/Containers"
    }
}
