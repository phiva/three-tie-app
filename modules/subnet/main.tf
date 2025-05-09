# modules/subnet/main.tf

resource "aws_subnet" "web_a" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = { Name = "web-a" }
}

resource "aws_subnet" "web_b" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = { Name = "web-b" }
}

resource "aws_subnet" "app_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "app-a" }
}

resource "aws_subnet" "app_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "app-b" }
}

resource "aws_subnet" "db_a" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1a"
  tags = { Name = "db-a" }
}

resource "aws_subnet" "db_b" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "us-east-1b"
  tags = { Name = "db-b" }
}

output "web_a_id" {
  value = aws_subnet.web_a.id
}

output "web_b_id" {
  value = aws_subnet.web_b.id
}

output "app_a_id" {
  value = aws_subnet.app_a.id
}

output "app_b_id" {
  value = aws_subnet.app_b.id
}

output "db_a_id" {
  value = aws_subnet.db_a.id
}

output "db_b_id" {
  value = aws_subnet.db_b.id
}
