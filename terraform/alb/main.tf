resource "aws_security_group" "alb_sg" {
  name   = "${var.project_name}-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

# ALB Name: max 32 chars, alphanumeric + hyphens only
resource "aws_lb" "alb" {
  name               = "${substr(replace(var.project_name, "/[^a-zA-Z0-9-]/", ""), 0, 20)}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnets

  enable_deletion_protection = false   # Set to true in production if needed

  tags = {
    Name = "${var.project_name}-alb"
  }
}

# Target Group: max 32 chars
resource "aws_lb_target_group" "tg" {
  name     = "${substr(replace(var.project_name, "/[^a-zA-Z0-9-]/", ""), 0, 20)}-tg"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip"        # Use "instance" if registering EC2 instances by ID

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    interval            = 30
    timeout             = 5
    path                = "/"           # Change to your app's health endpoint, e.g. "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200-399"
  }

  tags = {
    Name = "${var.project_name}-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Outputs
output "alb_sg_id"        { value = aws_security_group.alb_sg.id }
output "alb_dns_name"     { value = aws_lb.alb.dns_name }
output "alb_zone_id"      { value = aws_lb.alb.zone_id }
output "target_group_arn" { value = aws_lb_target_group.tg.arn }