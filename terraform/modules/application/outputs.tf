output "eks_kubeconfig" {
  value = module.container.kubeconfig
}

output "eks_tags" {
  value = module.container.tags
}
