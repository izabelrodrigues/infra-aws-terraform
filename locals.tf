locals {
  region = "us-east-1"

  name_vpc = "vpc-intensivao"

  tags = {
    Name = "intensivao-terraform"
  }

  network_acls = {

    default_inbound = [
      {
        rule_number = 90
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    default_outbound = [
      {
        rule_number = 90
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]

    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 120
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 140
        rule_action     = "allow"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
      {
        rule_number = 150
        rule_action = "allow"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 160
        rule_action     = "allow"
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
    ]
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 130
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 140
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = 8
        protocol    = "icmp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number     = 150
        rule_action     = "allow"
        from_port       = 90
        to_port         = 90
        protocol        = "tcp"
        ipv6_cidr_block = "::/0"
      },
      {
        rule_number = 160
        rule_action = "allow"
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
  }

  multiple_instances = {
    one = {
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.public_subnets, 0)
      key_name          = aws_key_pair.key_intensivao
      root_block_device = [
        {
          volume_type = "gp3"
          volume_size = 8
          tags = {
            Name = "my-root-block"
          }
        }
      ]
    }
    two = {
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.public_subnets, 1)
      key_name          = aws_key_pair.key_intensivao
      root_block_device = [
        {
          volume_type = "gp3"
          volume_size = 8
          tags = {
            Name = "my-root-block"
          }
        }
      ]
    }
  }

}
