### foundation/network
module "vpc" {
  source     = "Young-ook/spinnaker/aws//modules/spinnaker-aware-aws-vpc"
  name       = var.name
  tags       = var.tags
  azs        = var.azs
  cidr       = var.cidr
  enable_ngw = true
  single_ngw = true
}
