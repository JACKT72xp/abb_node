variable "function_app_name" {
  description = "Nombre de la función de Azure"
  type        = string
  default     = "example-function"
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos de Azure"
  type        = string
  default     = "example-resources"
}

variable "location" {
  description = "Ubicación de los recursos de Azure"
  type        = string
  default     = "East US"
}

variable "runtime_version" {
  description = "Versión de tiempo de ejecución de la función de Azure"
  type        = string
  default     = "14.x"
}

variable "zip_package_url" {
  description = "URL del paquete ZIP que contiene el código de la función de Azure"
  type        = string
}

variable "api_name" {
  description = "Nombre de la API de Azure Functions"
  type        = string
  default     = "example-function-api"
}

variable "api_path" {
  description = "Ruta de la API de Azure Functions"
  type        = string
  default     = "example"
}

variable "api_operation_method" {
  description = "Método de la operación de la API de Azure Functions"
  type        = string
  default     = "GET"
}

variable "api_operation_url_template" {
  description = "Plantilla de URL de la operación de la API de Azure Functions"
  type        = string
  default     = "/{id}"
}

variable "api_operation_response_status" {
  description = "Estado de respuesta de la operación de la API de Azure Functions"
  type        = number
  default     = 200
}
