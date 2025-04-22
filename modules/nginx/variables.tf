variable "release_name" {
  description = "Helm release name"
  type        = string
}

variable "namespace" {
  description = "Namespace to deploy the ingress controller"
  type        = string
}

variable "chart_version" {
  description = "Version of the ingress-nginx Helm chart"
  type        = string
}

variable "controller_service_type" {
  description = "Service type for the ingress controller (e.g., NodePort, LoadBalancer)"
  type        = string
  default     = "NodePort"
}
