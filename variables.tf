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

variable "base_values" {
  description = "Istio base Helm values"
  default     = []
  type        = list(string)
}

variable "discovery_values" {
  description = "Istio discovery Helm values"
  default     = []
  type        = list(string)
}

variable "ingress_values" {
  description = "Istio ingress Helm values"
  default     = []
  type        = list(string)
}
