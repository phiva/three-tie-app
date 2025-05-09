# modules/autoscaling/variables.tf

variable "instance_type" {
  description = "Tipo de instância para o Auto Scaling"
  default     = "t2.micro"
}

variable "image_id" {
  description = "ID da AMI para a instância"
  default = "ami-0f88e80871fd81e91"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets para o Auto Scaling"
  type        = list(string)
}

variable "security_group_ids" {
  description = "IDs dos grupos de segurança para o Auto Scaling"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Capacidade desejada do Auto Scaling"
  default     = 2
}

variable "max_size" {
  description = "Capacidade máxima do Auto Scaling"
  default     = 3
}

variable "min_size" {
  description = "Capacidade mínima do Auto Scaling"
  default     = 1
}
