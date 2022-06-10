variable "resource_group_name" {
  type        = string
  description = "The resource group name"
}

variable "location" {
  type        = string
  description = "Location (Azure Region) that will be used"
}

variable "allocation_method" {
    type        = string
    description = "For allocating an IP address, whether to use Static or Dynamic address"
    default     = "Dynamic" 
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Any tags that should be present on the resources"
}