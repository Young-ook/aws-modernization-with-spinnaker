### network
variable "aws_region" {
  description = "The aws region to deploy the service into"
  type        = string
}

variable "azs" {
  description = "The aws availability zones to deploy"
  type        = list
}

### kubernetes
variable "kubernetes_version" {
  description = "The target version of kubernetes"
  type        = string
}

### description
variable "name" {
  description = "The logical name of the module instance"
  type        = string
}

variable "stack" {
  description = "Text used to identify stack of infrastructure components"
  type        = string
  default     = ""
}

variable "detail" {
  description = "The extra description of module instance"
  type        = string
  default     = ""
}

### tags
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
