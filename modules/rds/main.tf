# modules/rds/main.tf

resource "aws_db_subnet_group" "rds" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "main" {
  identifier          = "app-db"
  engine              = "mysql"
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  multi_az            = var.multi_az
  publicly_accessible = var.publicly_accessible
  db_subnet_group_name = aws_db_subnet_group.rds.name
  skip_final_snapshot = true
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = "App-DB"
  }
}

output "db_instance_endpoint" {
  value = aws_db_instance.main.endpoint
}

output "db_instance_id" {
  value = aws_db_instance.main.id
}
