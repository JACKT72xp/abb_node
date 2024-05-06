variable "db_name" {
  description = "Nombre de la base de datos RDS PostgreSQL"
  type        = string
  default     = "my-database"
}

variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  default     = "mypassword"
}

variable "db_engine_version" {
  description = "Versión del motor de base de datos PostgreSQL"
  type        = string
  default     = "12.7"
}

variable "db_instance_class" {
  description = "Tipo de instancia para la base de datos RDS PostgreSQL"
  type        = string
  default     = "db.t2.micro"
}

variable "security_group_name" {
  description = "Nombre del grupo de seguridad"
  type        = string
  default     = "db-security-group"
}

variable "security_group_description" {
  description = "Descripción del grupo de seguridad"
  type        = string
  default     = "Security group for RDS PostgreSQL"
}
variable "lambda_function_name" {
  description = "Nombre de la función de Lambda"
  type        = string
  default     = "my-lambda-function"
}

variable "lambda_function_filename" {
  description = "Ruta al archivo ZIP de la función de Lambda"
  type        = string
  default     = "path/to/your/lambda_function.zip"
}

variable "api_gateway_name" {
  description = "Nombre de la API Gateway"
  type        = string
  default     = "my-rest-api"
}

variable "api_gateway_description" {
  description = "Descripción de la API Gateway"
  type        = string
  default     = "My REST API"
}

variable "api_resource_path_part" {
  description = "Parte del path para el recurso de la API Gateway"
  type        = string
  default     = "myresource"
}

variable "lambda_runtime" {
  description = "Versión del tiempo de ejecución de Lambda"
  type        = string
  default     = "nodejs14.x"
}

variable "lambda_function_root_name" {
  description = "Path Visitor"
  type        = string
  default     = "visitors"
}

variable "lambda_function_version_name" {
  description = "Path para la version"
  type        = string
  default     = "version"
}
