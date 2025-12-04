# Variable for Sandbox OU ARN
variable "sandbox_ou_arn" {
  description = "ARN of the Sandbox Organizational Unit"
  type        = string
  default     = "arn:aws:organizations::230263580633:ou/o-mmg25do8hz/ou-ahv1-ov9fv7qg"   # Replace this with data.source
}

# Create RAM Resource Share
resource "aws_ram_resource_share" "vpc_share" {
  name                      = "${var.project_name}-vpc-share"
  allow_external_principals = false

  tags = {
    Name        = "${var.project_name}-vpc-share"
    Description = "Share VPC subnets with Sandbox OU"
  }
}

# Share all public subnets
resource "aws_ram_resource_association" "public_subnets" {
  count              = length(aws_subnet.public)
  resource_arn       = aws_subnet.public[count.index].arn
  resource_share_arn = aws_ram_resource_share.vpc_share.arn
}

# Share all private subnets
resource "aws_ram_resource_association" "private_subnets" {
  count              = length(aws_subnet.private)
  resource_arn       = aws_subnet.private[count.index].arn
  resource_share_arn = aws_ram_resource_share.vpc_share.arn
}

# Share with the Sandbox OU
resource "aws_ram_principal_association" "sandbox_ou" {
  principal          = var.sandbox_ou_arn
  resource_share_arn = aws_ram_resource_share.vpc_share.arn
}
