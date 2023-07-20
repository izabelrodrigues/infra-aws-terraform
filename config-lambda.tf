resource "aws_lambda_permission" "with_lb" {
  statement_id  = "AllowExecutionFromlb"
  action        = "lambda:InvokeFunction"
  function_name = "alb_function_teste"
  principal     = "elasticloadbalancing.amazonaws.com"
  source_arn    = aws_lb_target_group.test.arn
}

resource "aws_lb_target_group" "test" {
  name        = "test"
  target_type = "lambda"
  depends_on  = [module.alb.lb_id]
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = "arn:aws:lambda:us-east-1:328328932161:function:alb_function_teste"
  depends_on       = [aws_lambda_permission.with_lb]
}

resource "aws_lb_listener" "listener_lambda" {
  load_balancer_arn = module.alb.lb_arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_lb_listener_rule" "listener_rule" {
  listener_arn = aws_lb_listener.listener_lambda.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }

  condition {
    path_pattern {
      values = ["/lambda"]
    }
  }

}
