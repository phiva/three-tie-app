# modules/route53/variables.tf

variable "domain_name" {
  description = "Nome de domínio para a zona Route 53"
  type        = string
}

variable "lb_dns_name" {
  description = "Nome DNS do Load Balancer"
  type        = string
}

variable "lb_zone_id" {
  description = "Zone ID do Load Balancer"
  type        = string
}
