### foundation/network
module "vpc" {
  source     = "Young-ook/spinnaker/aws//modules/spinnaker-aware-aws-vpc"
  name       = var.name
  tags       = var.tags
  azs        = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  cidr       = "10.0.0.0/16"
  enable_ngw = true
  single_ngw = true
}
