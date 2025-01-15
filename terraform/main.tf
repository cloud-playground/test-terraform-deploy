data "azurerm_resource_group" "test_rg" {
  name = "test-rg"
}

resource "azurerm_app_service_plan" "test-app" {
  name = "test-asp"
  location = "australiaeast"
  resource_group_name = data.azurerm_resource_group.test_rg.name
  sku {
    size = "P1V2"
    tier = "standard"
  }
}

resource "azurerm_linux_web_app" "testdeploy-app" {
  resource_group_name = data.azurerm_resource_group.test_rg.name
  name = "test-app"
  location = "australiaeast"
  service_plan_id = azurerm_app_service_plan.test-app.id
  site_config {}
}