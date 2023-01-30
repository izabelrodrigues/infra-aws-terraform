
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

  user_data = <<EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install nginx1 -y
  sudo systemctl enable nginx
  sudo systemctl start nginx
  echo "<h1> Nginx deployed with Terraform! </h1>" | sudo tee /usr/share/nginx/html/index.html
  EOF

  key_name = aws_key_pair.key_intensivao.key_name

  tags = local.tags

  depends_on = [
    aws_key_pair.key_intensivao,
    aws_security_group.subnet-intensivao-sg
  ]
}

