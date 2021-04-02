locals {
  services = ["yelbv2", ]
}

### platform/ecr
module "ecr" {
  for_each     = toset(local.services)
  source       = "Young-ook/eks/aws//modules/ecr"
  name         = each.key
  scan_on_push = false
}

### platform/ci
module "ci" {
  for_each = toset(local.services)
  source   = "Young-ook/spinnaker/aws//modules/codebuild"
  version  = "~> 2.0"
  name     = join("-", [each.key, var.name])
  tags     = var.tags
  environment_config = {
    image           = "aws/codebuild/standard:4.0"
    privileged_mode = true
    environment_variables = {
      ARTIFACT_BUCKET = module.spinnaker.artifact_repository
      REPOSITORY_URI  = module.ecr[each.key].url
      APP_NAME        = each.key
    }
  }
  source_config = {
    type      = "GITHUB"
    location  = "https://github.com/Young-ook/aws-modernization-with-spinnaker.git"
    buildspec = join("/", [each.key, "buildspec.yml"])
    version   = "main"
  }
  policy_arns = [
    module.ecr[each.key].policy_arns["read"],
    module.ecr[each.key].policy_arns["write"],
    module.spinnaker.artifact_write_policy_arn,
  ]
}

### platform/spinnaker
module "spinnaker" {
  source             = "Young-ook/spinnaker/aws"
  version            = "2.1.8"
  name               = "spinnaker"
  tags               = var.tags
  region             = "ap-northeast-2"
  azs                = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  cidr               = "10.0.0.0/16"
  kubernetes_version = "1.19"
  kubernetes_node_groups = [
    {
      name          = "default"
      min_size      = 1
      max_size      = 2
      desired_size  = 1
      disk_size     = "500"
      instance_type = "m5.4xlarge"
    }
  ]
  aurora_cluster = {}
  assume_role_arn = [
    module.spinnaker-managed.role_arn,
  ]
}

module "spinnaker-managed" {
  source           = "Young-ook/spinnaker/aws//modules/spinnaker-managed-aws"
  version          = "~> 2.0"
  name             = var.name
  trusted_role_arn = [module.spinnaker.role_arn]
}
