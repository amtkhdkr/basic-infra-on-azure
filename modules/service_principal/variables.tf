variable "client_id" {
  type        = string
  description = "The application ID (client ID) of the application for which to create a service principal"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Any tags that should be present on the resources"
}