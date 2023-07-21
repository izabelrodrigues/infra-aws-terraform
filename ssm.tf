resource "aws_ssm_parameter" "tg_name" {
  name        = "/tg-name-alb"
  description = "The parameter description"
  type        = "String"
  value       = aws_lb_target_group.test.name

  depends_on = [aws_lb_target_group.test]
}

resource "aws_ssm_parameter" "tg_id" {
  name        = "/tg-id-alb"
  description = "The parameter description"
  type        = "String"
  value       = aws_lb_target_group.test.id
  depends_on  = [aws_lb_target_group.test]
}
