output "eks_kubeconfig" {
  value = {
    context = module.container.cluster.id
    script  = module.container.kubeconfig
  }
}

output "eks_tags" {
  value = module.container.tags
}
