# Crear archivo zip para la función lambda de la raíz
resource "archive_file" "lambda_root_zip" {
  type        = "zip"
  source_dir  = "lambdas/root"
  output_path = "${path.module}/lambdas_root.zip"
}

# Crear archivo zip para la función lambda de la versión
resource "archive_file" "lambda_version_zip" {
  type        = "zip"
  source_dir  = "lambdas/version"
  output_path = "${path.module}/lambdas_version.zip"
}

# Crear función de Lambda para /
resource "aws_lambda_function" "lambda_function_root" {
  filename      = "${path.module}/lambdas_root.zip"
  function_name = var.lambda_function_root_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime
  vpc_config {
    subnet_ids         = [data.aws_subnet.first_subnet.id]
    security_group_ids = [data.aws_security_group.default_vpc_security_group.id]
    vpc_id             = data.aws_vpc.default.id
  }
  environment {
    variables = {
      DB_HOST     = aws_db_instance.my_db_instance.address
      DB_PORT     = aws_db_instance.my_db_instance.port
      DB_USERNAME = aws_db_instance.my_db_instance.username
      DB_PASSWORD = aws_db_instance.my_db_instance.password
    }
  }
}

# Crear función de Lambda para /version
resource "aws_lambda_function" "lambda_function_version" {
  filename      = "${path.module}/lambdas_version.zip"
  function_name = var.lambda_function_version_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.handler"
  runtime       = var.lambda_runtime
}


# Configurar API Gateway
resource "aws_api_gateway_rest_api" "my_rest_api" {
  name        = var.api_gateway_name
  description = var.api_gateway_description
}

# Configurar recurso para /
resource "aws_api_gateway_resource" "api_resource_root" {
  rest_api_id = aws_api_gateway_rest_api.my_rest_api.id
  parent_id   = aws_api_gateway_rest_api.my_rest_api.root_resource_id
  path_part   = ""
}

# Configurar recurso para /version
resource "aws_api_gateway_resource" "api_resource_version" {
  rest_api_id = aws_api_gateway_rest_api.my_rest_api.id
  parent_id   = aws_api_gateway_rest_api.my_rest_api.root_resource_id
  path_part   = "version"
}

# Configurar método para /
resource "aws_api_gateway_method" "method_root" {
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api.id
  resource_id   = aws_api_gateway_resource.api_resource_root.id
  http_method   = "GET"
  authorization = "NONE"
}

# Configurar método para /version
resource "aws_api_gateway_method" "method_version" {
  rest_api_id   = aws_api_gateway_rest_api.my_rest_api.id
  resource_id   = aws_api_gateway_resource.api_resource_version.id
  http_method   = "GET"
  authorization = "NONE"
}

# Configurar integración para /
resource "aws_api_gateway_integration" "integration_root" {
  rest_api_id             = aws_api_gateway_rest_api.my_rest_api.id
  resource_id             = aws_api_gateway_resource.api_resource_root.id
  http_method             = aws_api_gateway_method.method_root.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function_root.invoke_arn
}

# Configurar integración para /version
resource "aws_api_gateway_integration" "integration_version" {
  rest_api_id             = aws_api_gateway_rest_api.my_rest_api.id
  resource_id             = aws_api_gateway_resource.api_resource_version.id
  http_method             = aws_api_gateway_method.method_version.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda_function_version.invoke_arn
}

# Configurar permisos para Lambda para /
resource "aws_lambda_permission" "lambda_permission_root" {
  statement_id  = "AllowAPIGatewayInvokeRoot"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function_root.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = aws_api_gateway_rest_api.my_rest_api.execution_arn
}

# Configurar permisos para Lambda para /version
resource "aws_lambda_permission" "lambda_permission_version" {
  statement_id  = "AllowAPIGatewayInvokeVersion"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_function_version.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = aws_api_gateway_rest_api.my_rest_api.execution_arn
}
