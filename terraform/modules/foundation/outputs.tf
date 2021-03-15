output "vpc" {
  value = module.vpc.vpc
}

output "subnets" {
  value = module.vpc.subnets
}
