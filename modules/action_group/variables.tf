# ------------------
# General
# ------------------
variable "resource_group_name" {
  type        = string
  description = "The resource group name for the AKS Cluster"
}

variable "location" {
  type        = string
  description = "Location (Azure Region) that will be used for resources"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Any tags that should be present on the resources"
}