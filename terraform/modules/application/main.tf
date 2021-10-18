### application/eks - managed kubernetes service
module "container" {
  source             = "Young-ook/spinnaker/aws//modules/spinnaker-managed-eks"
  version            = "2.1.15"
  name               = var.name
  tags               = merge(var.tags, { release = "canary" })
  subnets            = var.subnets
  enable_ssm         = true
  kubernetes_version = var.kubernetes_version
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
    "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess",
    "arn:aws:iam::aws:policy/AWSAppMeshEnvoyAccess",
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
  enabled      = true
  cluster_name = module.container.cluster.name
  oidc         = module.container.oidc
  tags         = var.tags
}

module "app-mesh" {
  source       = "Young-ook/eks/aws//modules/app-mesh"
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
  enabled      = true
  cluster_name = module.container.cluster.name
  oidc         = module.container.oidc
  tags         = var.tags
}
