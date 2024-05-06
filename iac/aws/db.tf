# Crear un grupo de seguridad para la base de datos
resource "aws_security_group" "db_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  
  # Inbound rules
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Permitir acceso desde cualquier IP (ajustar según necesidades)
  }
  
  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear una instancia de base de datos RDS PostgreSQL
resource "aws_db_instance" "my_db_instance" {
  allocated_storage    = 20
  
  engine               = "postgres"
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
}
