
module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = local.name_vpc
  cidr = "10.1.0.0/16"

  azs                 = ["${local.region}a", "${local.region}b"]
  public_subnets      = ["10.1.10.0/24", "10.1.11.0/24"]
  public_subnet_names = ["subnet-public01", "subnet-public02"]

  enable_dhcp_options  = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_dedicated_network_acl = true
  public_inbound_acl_rules     = concat(local.network_acls["default_inbound"], local.network_acls["public_inbound"])
  public_outbound_acl_rules    = concat(local.network_acls["default_outbound"], local.network_acls["public_outbound"])

  tags = local.tags

}
