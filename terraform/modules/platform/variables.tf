### kubectl
variable "eks_kubeconfig" {
  description = "Path to script for eks kubeconfig file update"
  type        = string
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
