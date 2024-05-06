# Definir variables para la base de datos
variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}

# Crear instancia de base de datos RDS PostgreSQL
resource "azurerm_postgresql_server" "example_db" {
  name                = var.db_name
  ssl_enforcement_enabled = true
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
  sku_name            = "B_Gen5_1"  # Cambiar según tus necesidades
  version             = "11"
  administrator_login         = "admin_username"
  administrator_login_password = "admin_password"
  tags = {
    environment = "Production"
  }
}

# Puedes agregar más configuraciones para tu base de datos aquí
