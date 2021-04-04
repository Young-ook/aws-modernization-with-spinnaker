### kubernetes/config
variable "eks_kubeconfig" {
  description = "Attributes of eks kubeconfig for spinnaker integration"
  type        = map
}

### description
variable "name" {
  description = "The logical name of the module instance"
  type        = string
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
