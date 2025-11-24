output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_ids" {
  description = "IDs of public route tables"
  value       = aws_route_table.public[*].id
}

output "private_route_table_ids" {
  description = "IDs of private route tables"
  value       = aws_route_table.private[*].id
}

output "ram_resource_share_arn" {
  description = "ARN of the RAM resource share"
  value       = aws_ram_resource_share.vpc_share.arn
}

output "ram_resource_share_name" {
  description = "Name of the RAM resource share"
  value       = aws_ram_resource_share.vpc_share.name
}

output "shared_subnets" {
  description = "List of shared subnet IDs"
  value = concat(
    aws_subnet.public[*].id,
    aws_subnet.private[*].id
  )
}