provider "azurerm" {
  features {}
}

# Definir variables para la infraestructura
variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
  type        = string
}

variable "location" {
  description = "Ubicación de los recursos de Azure"
  type        = string
}

# Crear grupo de recursos
resource "azurerm_resource_group" "example_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Puedes agregar más recursos de infraestructura aquí, como redes virtuales, subredes, etc.
