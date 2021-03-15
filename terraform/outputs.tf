output "spinnaker_kubeconfig" {
  value = module.platform.spinnaker_kubeconfig
}

output "eks_kubeconfig" {
  value = module.application.eks_kubeconfig
}
