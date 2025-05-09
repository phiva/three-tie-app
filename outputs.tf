# outputs.tf

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "web_subnet_ids" {
  value = [module.subnet.web_a_id, module.subnet.web_b_id]
}

output "db_instance_endpoint" {
  value = module.rds.db_instance_endpoint
}

output "asg_id" {
  value = module.autoscaling.asg_id
}

output "lb_dns_name" {
  value = module.load_balancer.lb_dns_name
}
