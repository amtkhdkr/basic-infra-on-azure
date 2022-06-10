# ------------------
# General
# ------------------
variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "sku" {
  type = string
  description = "SKU to be used, Basic Standard or Premium (default)"
  default = "Premium"
}

variable "location" {
  type        = string
  description = "Location (Azure Region) that will be used"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Any tags that should be present on the resources"
}