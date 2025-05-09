# modules/load_balancer/variables.tf

variable "subnet_ids" {
  description = "IDs das subnets para o Load Balancer"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs dos grupos de segurança para o Load Balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}
