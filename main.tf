
locals {
  vpc_configs_map = {
    for vpc_configs_list in var.vpc_configs : vpc_configs_list.name => vpc_configs_list
  }
}


module "vpc-aws" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.0"

  for_each = local.vpc_configs_map

  name = each.value.name
  cidr = each.value.cidr

  azs             = each.value.azs
  private_subnets = each.value.private_subnets
  public_subnets  = each.value.public_subnets

  enable_nat_gateway = each.value.enable_nat_gateway

  tags = each.value.tags

}

