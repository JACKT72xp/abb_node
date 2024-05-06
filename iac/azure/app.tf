# Definir variables para la aplicación
variable "app_service_name" {
  description = "Nombre del servicio de aplicación web"
  type        = string
}

variable "app_service_plan_name" {
  description = "Nombre del plan de servicio de aplicación web"
  type        = string
}

# Crear plan de servicio de aplicación web
resource "azurerm_app_service_plan" "example_app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Crear servicio de aplicación web
resource "azurerm_app_service" "example_app_service" {
  name                = var.app_service_name
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  app_service_plan_id = azurerm_app_service_plan.example_app_service_plan.id
  site_config {
    always_on = true
    app_command_line = "node ./index.js"
    linux_fx_version = "NODE|14"
  }
}

# Puedes agregar más recursos específicos de la aplicación aquí
