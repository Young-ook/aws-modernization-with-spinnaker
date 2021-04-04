### application/eks - managed kubernetes service
module "container" {
  source             = "Young-ook/spinnaker/aws//modules/spinnaker-managed-eks"
  name               = var.name
  tags               = var.tags
  subnets            = var.subnets
  kubernetes_version = "1.19"
  managed_node_groups = [
    {
      name          = "default"
      min_size      = 1
      max_size      = 3
      desired_size  = 1
      instance_type = "m5.xlarge"
    }
  ]
  policy_arns = [
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
  ]
}

provider "helm" {
  kubernetes {
    host                   = module.container.helmconfig.host
    token                  = module.container.helmconfig.token
    cluster_ca_certificate = base64decode(module.container.helmconfig.ca)
  }
}

module "alb-ingress" {
  source       = "Young-ook/eks/aws//modules/alb-ingress"
  version      = "1.4.7"
  enabled      = true
  cluster_name = module.container.cluster.name
  oidc         = module.container.oidc
  tags         = var.tags
}

module "app-mesh" {
  source       = "Young-ook/eks/aws//modules/app-mesh"
  version      = "1.4.8"
  enabled      = true
  cluster_name = module.container.cluster.name
  oidc         = module.container.oidc
  tags         = var.tags
  helm = {
    version = "1.3.0"
  }
}

module "container-insights" {
  source       = "Young-ook/eks/aws//modules/container-insights"
  version      = "1.4.7"
  enabled      = true
  cluster_name = module.container.cluster.name
  oidc         = module.container.oidc
  tags         = var.tags
}
