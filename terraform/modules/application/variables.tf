### network
variable "subnets" {
  description = "Subnet IDs where to locate eks cluster"
  type        = list
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
