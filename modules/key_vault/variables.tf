variable "tenant_id" {
    type = string
    description = "Tenant ID for the resource"
}
variable "object_id" {
    type = string
    description = "Object to which we need to allow permissions to"
}
variable "sku_name" {
  type = string
  description = "Type of SKU required, standard or premium"
  default = "premium"
}
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