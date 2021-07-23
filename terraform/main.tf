### frigga naming
module "frigga" {
  source = "Young-ook/spinnaker/aws//modules/frigga"
  name   = var.name
  stack  = var.stack
  detail = var.detail
}

### foundation
module "foundation" {
  source = "./modules/foundation"
  name   = module.frigga.name
  azs    = var.azs
  tags = merge(
    var.tags,
    (module.application.eks_tags.shared == null ? {} : module.application.eks_tags.shared)
  )
}

### application
module "application" {
  source             = "./modules/application"
  name               = module.frigga.name
  tags               = var.tags
  subnets            = values(module.foundation.subnets["private"])
  kubernetes_version = var.kubernetes_version
}

### platform
module "platform" {
  source             = "./modules/platform"
  name               = module.frigga.name
  tags               = var.tags
  aws_region         = var.aws_region
  azs                = var.azs
  kubernetes_version = var.kubernetes_version
  eks_kubeconfig     = module.application.eks_kubeconfig
}
