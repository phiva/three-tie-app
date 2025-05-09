# modules/rds/variables.tf

variable "instance_class" {
  description = "Classe da instância RDS"
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Armazenamento alocado para o RDS"
  default     = 20
}

variable "db_name" {
  description = "Nome do banco de dados"
  default     = "appdb"
}

variable "db_username" {
  description = "Nome do usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Se a instância deve ser Multi-AZ"
  default     = true
}

variable "publicly_accessible" {
  description = "Se a instância é acessível publicamente"
  default     = false
}

variable "subnet_ids" {
  description = "IDs das subnets para o RDS"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs dos grupos de segurança para o RDS"
  type        = list(string)
}
