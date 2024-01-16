output "vpc_id" {
  description = "The ID of the VPC"
  value = {
    for k, vpc in module.vpc-aws : k => vpc.vpc_id
  }
}
