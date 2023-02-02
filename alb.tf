module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.2.2"

  name = "my-alb-app"

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = [element(module.vpc.public_subnets, 0), element(module.vpc.public_subnets, 1)]
  security_groups = [aws_security_group.subnet-intensivao-sg.id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = module.ec2_multiple["one"].id
          port      = 80
        }
        my_other_target = {
          target_id = module.ec2_multiple["two"].id
          port      = 80
        }
      }
    }
  ]


  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

}
