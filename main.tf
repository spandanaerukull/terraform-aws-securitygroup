resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
    ipv6_cidr_blocks = ["::/0"] # Allow all outbound IPv6 traffic
  }
  

  tags = merge(
    var.sg_tags,
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-${var.sg_name}" #output :roboshop-dev-frontend
    }
  )
}