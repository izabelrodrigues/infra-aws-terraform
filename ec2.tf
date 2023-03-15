
module "ec2_multiple" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  for_each = local.multiple_instances

  name = "instance-app-${each.key}"

  instance_type = var.ami_type
  ami           = var.ami_id

  availability_zone      = each.value.availability_zone
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [aws_security_group.subnet-intensivao-sg.id]

  enable_volume_tags = false
  root_block_device  = lookup(each.value, "root_block_device", [])

  user_data = filebase64("user_data.sh")

  key_name = aws_key_pair.key_intensivao.key_name

  tags = local.tags

  depends_on = [
    aws_key_pair.key_intensivao,
    aws_security_group.subnet-intensivao-sg
  ]
}

