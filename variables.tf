variable "name_prefix" {
  description = "Prefix to be used when installing."
  default     = "combinator"
  type        = string
}

variable "namespace" {
  description = "The namespace to install into."
  default     = "istio-system"
  type        = string
}

variable "enable_default_control_plane" {
  description = "Whether to install a default control plane"
  default     = true
  type        = bool
}
