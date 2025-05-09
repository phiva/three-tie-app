# modules/autoscaling/main.tf

resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt"
  image_id      = var.image_id
  instance_type = var.instance_type

  network_interfaces {
    security_groups           = var.security_group_ids
    associate_public_ip_address = true
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  health_check_type          = "EC2"
  health_check_grace_period = 300
  wait_for_capacity_timeout   = "0"
}

output "asg_id" {
  value = aws_autoscaling_group.web_asg.id
}
