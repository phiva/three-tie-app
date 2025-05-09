# modules/vpc/variables.tf

variable "cidr_block" {
  description = "CIDR Block da VPC"
  type        = string
  default     = "10.0.0.0/16"
}
