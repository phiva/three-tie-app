# variables.tf

variable "aws_region" {
  description = "A região da AWS"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "O CIDR block da VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  description = "Tipo de instância para os recursos"
  default     = "t2.micro"
}

variable "db_username" {
  description = "Usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  sensitive   = true
}
