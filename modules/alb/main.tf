resource "aws_lb" "app_lb" {
  name               = "abbie-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets

  tags = {
    Name = "abbie-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "abbie-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

# Corrected attachment using toset() so for_each works
resource "aws_lb_target_group_attachment" "attach" {
  for_each         = toset(var.web_instance_ids)
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = each.value
  port             = 80
}
