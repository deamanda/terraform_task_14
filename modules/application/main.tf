resource "aws_launch_template" "alt" {
  name          = var.template
  image_id      = "ami-042d7899818bea126"
  instance_type = "t3.micro"

  network_interfaces {
    delete_on_termination = true
    security_groups = [
      var.sg_ssh_id, var.sg_private_http_id
    ]
  }

  user_data = filebase64("${path.module}/script.sh")

}

resource "aws_autoscaling_group" "asg" {
  name                = var.asg
  max_size            = 2
  min_size            = 2
  desired_capacity    = 2
  vpc_zone_identifier = [var.subnet1_id]
  target_group_arns = [
    aws_lb_target_group.target_group.arn
  ]
  lifecycle {
    ignore_changes = [
      load_balancers,
      target_group_arns
    ]
  }
  launch_template {
    id      = aws_launch_template.alt.id
    version = "$Latest"
  }
}

resource "aws_lb" "load_balancer" {
  name               = var.loadbalancer
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_public_http_id]
  subnets            = [var.subnet1_id, var.subnet2_id, var.subnet3_id]
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = var.tg
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.asg.id
  lb_target_group_arn    = aws_lb_target_group.target_group.arn
}